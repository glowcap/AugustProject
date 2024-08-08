//
//  DesignSystem+TextStyle.swift
//  AugustProject
//
//  Created by Daymein Gregorio on 8/7/24.
//

import SwiftUI

extension DesignSystem.Component.Text.Style {
  
  fileprivate struct DesignSystemText: ViewModifier {
    func body(content: Content) -> some View {
      content
        .font(.body)
        .fontDesign(.rounded)
    }
  }
  
  struct TextPrimary: ViewModifier {
    func body(content: Content) -> some View {
      content
        .foregroundStyle(DesignSystem.Token.Color.Text.primary)
    }
  }
  
  struct TextSecondary: ViewModifier {
    func body(content: Content) -> some View {
      content
        .foregroundStyle(DesignSystem.Token.Color.Text.secondary)
    }
  }
  
}

extension View {
  
  fileprivate func designSystemText() -> some View {
    modifier(DesignSystem.Component.Text.Style.DesignSystemText())
  }
  
  func textPrimary() -> some View {
    modifier(DesignSystem.Component.Text.Style.TextPrimary())
  }
  
  func textSecondary() -> some View {
    modifier(DesignSystem.Component.Text.Style.TextSecondary())
  }
  
}
