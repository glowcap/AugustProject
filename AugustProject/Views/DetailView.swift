//
//  DetailView.swift
//  AugustProject
//
//  Created by Daymein Gregorio on 8/6/24.
//

import SwiftUI

struct DetailView: View {
  
  @ObservedObject var orientation = Orientation()
  
  typealias TextColor = DesignSystem.Token.Color.Text
  typealias CornerRadius = DesignSystem.Token.CornerRadius
  
  var item: Item
  
  var body: some View {
    NavigationStack {
      ScrollView {
        if orientation.isLandscape {
          HStack {
            mainImage
            details
          }.padding()
        } else {
          VStack {
            mainImage
            details
          }
          .padding()
        }
//        VStack {
//          Group {
//            Group {
//              AsyncImage(url: URL(string: item.urlStr)) { phase in
//                switch phase {
//                case .failure:
//                  Image(systemName: "photo")
//                    .font(.largeTitle)
//                case .success(let image):
//                  image
//                    .resizable()
//                default:
//                  ProgressView()
//                    .tint(.indigo)
//                }
//              }
//              .accessibilityElement() // here and not on image or the accessibility label is ignored
//              .accessibilityLabel(item.altText)
//              .frame(width: item.width, height: item.height)
//              .clipShape(RoundedRectangle(cornerRadius: CornerRadius.medium))
//              .shadow(color: .gray, radius: CornerRadius.medium, x: 2, y: 2)
//            }
//            Text(item.title)
//              .titlePrimaryLarge()
//            Divider()
//            Text("More about this image:")
//              .titlePrimary()
//            HStack(alignment: .center) {
//              Text("Width: \(Int(item.width))")
//                .textPrimary()
//                .padding(DesignSystem.Token.Spacing.small)
//              Text("x")
//                .textSecondary()
//                .accessibilityElement(children: .ignore)
//                .accessibilityLabel("by")
//              Text("Height: \(Int(item.height))")
//                .textPrimary()
//                .padding(DesignSystem.Token.Spacing.small)
//            }.accessibilityElement(children: .combine)
//            Divider()
//            Text(item.author)
//              .textSecondary()
//          }
//        }
//        .padding()
      }
      .navigationTitle(item.title)
      .navigationBarTitleDisplayMode(.inline)
    }
  }
  
}

extension DetailView {
  
  var details: some View {
    VStack {
      Text(item.title)
        .titlePrimaryLarge()
      Divider()
      Text("More about this image:")
        .titlePrimary()
      HStack(alignment: .center) {
        Text("Width: \(Int(item.width))")
          .textPrimary()
          .padding(DesignSystem.Token.Spacing.small)
        Text("x")
          .textSecondary()
          .accessibilityElement(children: .ignore)
          .accessibilityLabel("by")
        Text("Height: \(Int(item.height))")
          .textPrimary()
          .padding(DesignSystem.Token.Spacing.small)
      }.accessibilityElement(children: .combine)
      Divider()
      Text(item.author)
        .textSecondary()
    }
  }
  
  var mainImage: some View {
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
  }
  
}

//#Preview {
//  DetailView()
//}
