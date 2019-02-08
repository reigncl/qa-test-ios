//
//  BasePresenter.swift
//  Vendomatica
//
//  Created by Andres Torres on 8/29/18.
//  Copyright © 2018 Abstract. All rights reserved.
//

import Foundation

class BasePresenter {

  internal weak var baseView: BaseView?

  init() {}

  func attachView<T: BaseView>(view: T) {
    self.baseView = view
  }
}
