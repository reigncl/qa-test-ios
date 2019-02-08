//
//  Wireframe.swift
//  Vendomatica
//
//  Created by Andres Torres on 8/29/18.
//  Copyright © 2018 Abstract. All rights reserved.
//

import UIKit
import Swinject

class Wireframe {

  // MARK: - ViewController
  func popCurrentScreen(_ completion: @escaping (() -> Void) = { }) {
    // Pop if there is a Navigation Controller
    if let navigationController = UIApplication.shared.keyWindow?.rootViewController?.parent as? UINavigationController, navigationController.viewControllers.count > 1 {
      navigationController.popViewController(animated: true)
    } else { // If not, dismiss
      UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: completion)
    }
  }
  
  func dismissController(animated: Bool = true, completion: (() -> Void)?) {
    UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: animated, completion: {
      completion?()
    })
  }
}
