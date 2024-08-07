//
//  DesignSystem+Tokens.swift
//  AugustProject
//
//  Created by Daymein Gregorio on 8/7/24.
//

import SwiftUI

extension DesignSystem.Token.Color {
  
  struct Text {
    static let primary: Color = Color(UIColor.darkText)
    static let secondary: Color = Color(UIColor.darkGray)
  }
  
}

extension DesignSystem.Token.Spacing {
  
  /// 4pt spacing
  static let small: Double = 4
  
  /// 8pt spacing
  static let medium: Double = 8
  
  /// 16pt spacing
  static let large: Double = 16
  
  /// 24pt spacing
  static let xlarge: Double = 24
  
}

extension DesignSystem.Token.CornerRadius {
  
  /// 4pt corner radius
  static let small: Double = 4
  
  /// 8pt corner radius
  static let medium: Double = 8
  
  /// 16pt corner radius
  static let large: Double = 16
  
}
