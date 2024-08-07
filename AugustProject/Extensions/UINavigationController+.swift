//
//  UINavigationController+.swift
//  AugustProject
//
//  Created by Daymein Gregorio on 8/6/24.
//

import UIKit

extension UINavigationController {
  
  /// Removes text from navigation bar back button
  open override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    navigationBar.topItem?.backButtonDisplayMode = .minimal
  }
}
