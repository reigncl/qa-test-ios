//
//  BaseView.swift
//  Vendomatica
//
//  Created by Andres Torres on 8/29/18.
//  Copyright © 2018 Abstract. All rights reserved.
//

import UIKit

protocol BaseView: class {
  func getViewController() -> UIViewController
  func showLoading()
  func hideLoading()
  func showSimpleAlert(message: String)
}
