//
//  UIApplication+topViewController.swift
//  Vendomatica
//
//  Created by Andres Torres on 8/29/18.
//  Copyright © 2018 Abstract. All rights reserved.
//

import UIKit

extension UIApplication {

  class func topViewController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {

    if let nav = base as? UINavigationController {
      return topViewController(nav.visibleViewController)
    }
    if let tab = base as? UITabBarController {
      if let selected = tab.selectedViewController {
        return topViewController(selected)
      }
    }
    if let presented = base?.presentedViewController {
      return topViewController(presented)
    }
    return base
  }
}
