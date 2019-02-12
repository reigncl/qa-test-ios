//
//  RegisterPresenter.swift
//  wedding
//
//  Created by Abstract on 2/12/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import Foundation

class RegisterPresenter: BasePresenter {
  private var view: RegisterView? {
    return baseView as? RegisterView
  }
  
  var repository: UserRepository
  
  init(repository: UserRepository) {
    self.repository = repository
  }
  
  func logIn(_ name: String, lastName: String){
    self.view?.showLoading()
    repository.logIn(firstName: name, nickName: "", lastName: lastName){ user in
      self.view?.hideLoading()
      self.view?.registeredSuccessfully(user)
    }
  }
}
