//
//  Thumbnail.swift
//  AugustProject
//
//  Created by Daymein Gregorio on 8/7/24.
//

import SwiftUI

struct ThumbnailView: View {
  
  var image: Image
  
  init(image: Image) {
    self.image = image
  }
    
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 8)
        .fill(.indigo)
      image
        .resizable()
        .scaledToFit()
        .cornerRadius(8)
        .padding(2)
    }
  }
  
}

//#Preview {
//    Thumbnail()
//}
