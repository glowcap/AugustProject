//
//  Orientation.swift
//  AugustProject
//
//  Created by Daymein Gregorio on 8/7/24.
//

import SwiftUI

class Orientation: ObservableObject {
  @Published var isLandscape: Bool = UIDevice.current.orientation.isLandscape
}
