//
//  BasePopup.swift
//  Vendomatica
//
//  Created by Andres Torres on 9/3/18.
//  Copyright © 2018 Abstract. All rights reserved.
//

import UIKit

class BasePopup: BaseViewController<BasePresenter> {

  func showAnimate() {
    self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
    self.view.alpha = 0.0
    UIView.animate(withDuration: 0.25, animations: {
      self.view.alpha = 1.0
      self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
    })
  }

  func removeAnimate() {
    UIView.animate(withDuration: 0.25, animations: {
      self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
      self.view.alpha = 0.0
    }, completion: {(finished: Bool)  in
      if finished {
        self.view.removeFromSuperview()
        self.removeFromParent()
      }
    })
  }
}
