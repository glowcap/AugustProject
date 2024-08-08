//
//  DesignSystem.swift
//  AugustProject
//
//  Created by Daymein Gregorio on 8/7/24.
//

import SwiftUI

/// This should be a package, but Xcode is forcing restarts with every new
/// file added to the package. It's slowing me down, so I'm leaving this here for now.

struct DesignSystem {}

extension DesignSystem {
  
  struct Token {
    struct Color {}
    struct Spacing {}
    struct CornerRadius {}
  }
  
  struct Component {
    struct Text {
      struct Style {}
    }
  }
  
}
