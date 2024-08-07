//
//  ImageFetchService.swift
//  AugustProject
//
//  Created by Daymein Gregorio on 8/6/24.
//

import Combine
import SwiftUI

final class ImageFetchService: ObservableObject {
  
  @Published var fetchedResults = [Item]()
  
  var imageFetchSubscription: AnyCancellable?
  
  init() {
    fetchImages()
  }
  
  func fetchImages(of subject: String = "") {
    guard !subject.isEmpty,
          let url = URL(string: "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags=\(subject)")
    else { return }
    imageFetchSubscription = NetworkManager.download(from: url)
      .decode(type: ImageFetchResult.self, decoder: JSONDecoder())
      .sink(
        receiveCompletion: NetworkManager.handleCompletion,
        receiveValue: { [weak self] result in
          self?.fetchedResults = result.items
          self?.imageFetchSubscription?.cancel()
        })
  }
  
}
