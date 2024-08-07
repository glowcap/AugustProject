//
//  SearchView.swift
//  AugustProject
//
//  Created by Daymein Gregorio on 8/6/24.
//

import SwiftUI

struct SearchView: View {
  
  @Environment(\.dynamicTypeSize) var dynamicTypeSize
  
  @State private var searchText = ""
  
  @StateObject private var service = ImageFetchService()
  
  var columns: [GridItem] {
    switch dynamicTypeSize {
    case .xSmall, .small, .medium, .large:
      return Array(repeating: GridItem(.flexible()), count: 3)
    case .xLarge, .xxLarge, .xxxLarge:
      return Array(repeating: GridItem(.flexible()), count: 2)
    case .accessibility1, .accessibility2, .accessibility3, .accessibility4, .accessibility5:
      return Array(repeating: GridItem(.flexible()), count: 1)
    @unknown default:
      return Array(repeating: GridItem(.flexible()), count: 1)
    }
  }
  
  var body: some View {
    GeometryReader { proxy in
      NavigationStack {
        Group {
          if service.fetchedResults.isEmpty, searchText.isEmpty {
            startingView
          } else if service.fetchedResults.isEmpty {
            progressView
          } else {
            mainContentView(proxy: proxy)
          }
        }
        .navigationTitle("Flickr Search")
        .navigationBarTitleDisplayMode(.inline)
      }
    }
    .accentColor(.indigo)
    .searchable(text: $searchText, prompt: "Search for Images")
    .textInputAutocapitalization(.never)
    .onChange(of: searchText) {
      service.fetchImages(of: searchText)
    }
  }
}

// MARK: - Content Views

extension SearchView {
  
  /// Content for first launch before user searches for anything
  var startingView: some View {
    VStack {
      Text("Search To Find Wonderful Images")
        .font(.system(.headline, design: .rounded, weight: .semibold))
      Spacer()
    }.padding(24)
  }
  
  
  /// Shown when between results
  var progressView: some View {
    VStack(alignment: .center) {
      ProgressView()
        .controlSize(.extraLarge)
        .tint(Color.indigo)
    }
  }
  
  /// Main content view. Shows search results in scrolling grid view.
  /// - Parameter proxy: GeometryProxy for calculating max thumbnail sizes
  /// - Returns: Main content view for search results
  func mainContentView(proxy: GeometryProxy) -> some View {
    ScrollView {
      LazyVGrid(columns: columns, spacing: 8) {
        ForEach(service.fetchedResults) { item in
          NavigationLink {
            DetailView(item: item)
          } label: {
            AsyncImage(url: URL(string: item.urlStr)) { phase in
              switch phase {
              case .failure:
                Image(systemName: "photo")
                  .font(.largeTitle)
                  .background(Color.gray)
              case .success(let image):
                ThumbnailView(image: image)
              default:
                ProgressView()
              }
            }
            .frame(
              maxWidth: (proxy.size.width / CGFloat(columns.count)),
              maxHeight: (proxy.size.width / CGFloat(columns.count))
            )
            .border(Color.indigo, width: 2)
            .cornerRadius(8)
            .padding(.horizontal, 6)
          }
          .accessibilityLabel(item.altText)
          .accessibilityHint("Tap to find out more.")
        }
      }
      .padding(.horizontal)
    }
  }
    
}

#Preview {
  SearchView()
}
