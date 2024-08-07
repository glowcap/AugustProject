//
//  NetworkManager.swift
//  AugustProject
//
//  Created by Daymein Gregorio on 8/6/24.
//

import Combine
import Foundation

/// Simple Networking Manager to download data
///
/// - seealso: ``NetworkError`` to learn more about possible errors thrown
///
/// ## Usage
/// Call the static method `download(from:)` to subscribe to the Data response
///
/// ## Example
///
/// ```
/// NetworkManager.download(from: myURL)
///   .decode(type: MyDataType.self, decoder: JSONDecoder())
///   .sink(receiveCompletion: NetworkingManager.handleCompletion,
///   receiveValue: { [weak self] value in
///      /// handle value
///   }
/// ```
///
final class NetworkManager {
  
  /// Method for downloading `Data` from the provided `URL`
  /// - Parameter url: `URL` from where data is provided
  /// - Returns: a publisher of <Data, NetworkError> on `DispatchQueue.main`
  static func download(from url: URL) -> AnyPublisher<Data, NetworkError> {
    /// - Note: here, I would improve this by using `dataTaskPublisher(urlRequest:)`
    /// to allow for improved logging of the request, headers, etc being sent.
    return URLSession.shared.dataTaskPublisher(for: url)
      .subscribe(on: DispatchQueue.global(qos: .default))
      .tryMap { try handleURLResponse(output: $0) }
      .receive(on: DispatchQueue.main)
      .mapError { _ in NetworkError.unknown(statusCode: -2) }
      .eraseToAnyPublisher()
  }
  
  /// Minimal URL response  handler that throws `NetworkError` on failure
  /// - Parameter output: output of `DataTaskPublisher` to be processed
  /// - Returns: returns `Data` to be parsed
  static func handleURLResponse(output: URLSession.DataTaskPublisher.Output) throws -> Data {
    guard let response = output.response as? HTTPURLResponse
    else { throw NetworkError.unknown(statusCode: -1) }
    guard response.statusCode >= 200 && response.statusCode < 300
    else {
      throw NetworkError.errorFor(statusCode: response.statusCode)
    }
    return output.data
  }
  
  /// Basic completion handler for network responses.
  /// - Parameter completion: `Subscribers.Completion<Error>` to allow for debugging
  /// - Note: failures are logs to allow for improved debugging.
  static func handleCompletion(_ completion: Subscribers.Completion<Error>) {
    switch completion {
    case .finished:
      break
    case .failure(let error):
      // TODO: Implement logger and replace print statements with info debug logs
      if let err = error as? NetworkError {
        print(err.errorDescription ?? err.localizedDescription)
      } else {
        print(error.localizedDescription)
      }
    }
  }
  
}
