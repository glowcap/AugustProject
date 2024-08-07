//
//  DetailView.swift
//  AugustProject
//
//  Created by Daymein Gregorio on 8/6/24.
//

import SwiftUI

struct DetailView: View {
  
  typealias TextColor = DesignSystem.Token.Color.Text
  typealias CornerRadius = DesignSystem.Token.CornerRadius
  
  var item: Item
  
  var body: some View {
    NavigationStack {
      ScrollView {
        VStack {
          Group {
            AsyncImage(url: URL(string: item.urlStr)) { phase in
              switch phase {
              case .failure:
                Image(systemName: "photo")
                  .font(.largeTitle)
              case .success(let image):
                image
                  .resizable()
              default:
                ProgressView()
                  .tint(.indigo)
              }
            }
            .accessibilityElement() // here and not on image or the accessibility label is ignored
            .accessibilityLabel(item.altText)
            .frame(width: item.width, height: item.height)
            .clipShape(RoundedRectangle(cornerRadius: CornerRadius.medium))
            .shadow(color: .gray, radius: CornerRadius.medium, x: 2, y: 2)
          }
          Text(item.title)
            .font(.system(.title, design: .rounded, weight: .medium))
            .foregroundStyle(TextColor.primary)
          Divider()
          HStack() {
            Spacer()
            Text(item.author)
              .font(.system(.footnote, design: .rounded, weight: .light))
              .foregroundStyle(TextColor.secondary)
          }
        }
        .padding()
      }
      .navigationTitle(item.title)
      .navigationBarTitleDisplayMode(.inline)
    }
  }
  
}

//#Preview {
//  DetailView()
//}
