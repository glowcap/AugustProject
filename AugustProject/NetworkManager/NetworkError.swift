//
//  NetworkError.swift
//  AugustProject
//
//  Created by Daymein Gregorio on 8/6/24.
//

import Foundation


/// NetworkError is a Error enum that supplies the status code for logging and debugging.
///
/// - seealso: ``NetworkManager`` to see how `NetworkError` is assigned
///
/// ## Usage
/// Use `NetworkError` to debug for specific status codes
///
/// ## Example
///
/// ```
/// logger.logInfo(myNetworkError.errorDescription ?? myNetworkError.localizedDescription)
/// ```
///
enum NetworkError: LocalizedError {
  
  case unhandled(statusCode: Int) // 100s
  case redirection(statusCode: Int) // 300s
  case clientError(statusCode: Int) // 400s
  case serverError(statusCode: Int) // 500s
  case unknown(statusCode: Int)
  
  var errorDescription: String? {
    var msg = "⛔️ NetworkError: "
    switch self {
    case .unhandled(statusCode: let statusCode):
      msg += "unhandled: \(statusCode)"
    case .redirection(statusCode: let statusCode):
      msg += "redirection: \(statusCode)"
    case .clientError(statusCode: let statusCode):
      msg += "clientError: \(statusCode)"
    case .serverError(statusCode: let statusCode):
      msg += "serverError: \(statusCode)"
    case .unknown(statusCode: let statusCode):
      msg += "unknown: \(statusCode)"
    }
    return msg
  }
  
  static func errorFor(statusCode: Int) -> NetworkError {
    switch statusCode {
    case 100...199: return .unhandled(statusCode: statusCode)
    case 300...399: return .redirection(statusCode: statusCode)
    case 400...499: return .clientError(statusCode: statusCode)
    case 500...599: return .serverError(statusCode: statusCode)
    default: return .unknown(statusCode: statusCode)
    }
  }

}
