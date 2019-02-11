//
//  WishesPresenter.swift
//  wedding
//
//  Created by Abstract on 2/11/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import Foundation

class WishesPresenter: BasePresenter {
  
  private var view: WishesView? {
    return baseView as? WishesView
  }
  
  var repository: WishesRepository
  
  init(repository: WishesRepository) {
    self.repository = repository
  }
  
  func attemptWishes(){
    self.view?.showLoading()
    repository.getWishes(){ wishes in
      self.view?.hideLoading()
      self.view?.wishesSuccessfully(wishes)
    }
  }
  
  func sendWish(_ comment: String) {
    self.view?.showLoading()
    repository.sendWish(user: "5c61bdaa39959c0017574674", comment: comment) { wish in
      self.view?.hideLoading()
      self.view?.wishCreatedSuccessfully(wish)
    }
  }
}
