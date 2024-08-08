//
//  DesignSystem+TextTitleStyle.swift
//  AugustProject
//
//  Created by Daymein Gregorio on 8/7/24.
//

import SwiftUI

extension DesignSystem.Component.Text.Style {

  /// Sets the base of the Title font formatting.
  ///
  ///  - seealso: ``DesignSystemText``
  ///
  ///  - Important: Not for direct use outside of DesignSystem.
  ///
  fileprivate struct DesignSystemTitle: ViewModifier {
    func body(content: Content) -> some View {
      content
        .fontDesign(.rounded)
        .fontWeight(.semibold)
        .foregroundStyle(DesignSystem.Token.Color.Text.primary)
    }
  }
  
  /// View modifier assigning font `title2` to `DesignSystemTitle` modifiers
  struct TitlePrimary: ViewModifier {
    func body(content: Content) -> some View {
      content
        .font(.title2)
        .designSystemTitle()
    }
  }
  
  /// View modifier assigning font `title` to `DesignSystemTitle` modifiers
  struct TitlePrimaryMedium: ViewModifier {
    func body(content: Content) -> some View {
      content
        .font(.title)
        .designSystemTitle()
    }
  }

  /// View modifier assigning font `largeTitle` to `DesignSystemTitle` modifiers
  struct TitlePrimaryLarge: ViewModifier {
    func body(content: Content) -> some View {
      content
        .font(.largeTitle)
        .designSystemTitle()
    }
  }
  
}


extension View {
  
  /// Base Design System Component for TitlePrimary styles (internal use only)
  /// ## Usage
  /// Used in constructing new layers of DesignSystem Title style
  /// - seealso: `titlePrimary`, `titlePrimaryMedium`, `titlePrimaryLarge`
  /// - Returns: view with base font styling for TitlePrimary is applied
  /// - Important: Not for use outside of DesignSystem
  fileprivate func designSystemTitle() -> some View {
    modifier(DesignSystem.Component.Text.Style.DesignSystemTitle())
  }

  /// Standard Title text using `.title2` and primary text color
  ///
  /// - seealso: ``DesignSystem/Token/Color/Text`` to learn more about text colors
  ///
  /// ## Usage
  /// apply to `Text` component to set as `titlePrimary` text
  ///
  /// ## Example
  ///
  /// ```
  ///  Text("My Cool Title")
  ///    .titlePrimary()
  /// ```
  ///
  func titlePrimary() -> some View {
    modifier(DesignSystem.Component.Text.Style.TitlePrimary())
  }
  
  /// Medium Title text using `.title` and primary text color
  ///
  /// - seealso: ``DesignSystem/Token/Color/Text`` to learn more about text colors
  ///
  /// ## Usage
  /// apply to `Text` component to set as `titlePrimaryMedium` text
  ///
  /// ## Example
  ///
  /// ```
  ///  Text("My Cool Title")
  ///    .titlePrimaryMedium()
  /// ```
  ///
  func titlePrimaryMedium() -> some View {
    modifier(DesignSystem.Component.Text.Style.TitlePrimaryMedium())
  }

  /// Medium Title text using `.largeTitle` and primary text color
  ///
  /// - seealso: ``DesignSystem/Token/Color/Text`` to learn more about text colors
  ///
  /// ## Usage
  /// apply to `Text` component to set as `titlePrimaryLarge` text
  ///
  /// ## Example
  ///
  /// ```
  ///  Text("My Cool Title")
  ///    .titlePrimaryLarge()
  /// ```
  func titlePrimaryLarge() -> some View {
    modifier(DesignSystem.Component.Text.Style.TitlePrimaryLarge())
  }
  
}

#Preview {
  VStack {
    Text("Hello")
      .titlePrimary()
    Text("Hello")
      .titlePrimaryMedium()
    Text("Hello")
      .titlePrimaryLarge()
  }
}
