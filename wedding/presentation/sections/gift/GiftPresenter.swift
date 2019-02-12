//
//  GiftPresenter.swift
//  wedding
//
//  Created by Abstract on 2/12/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import Foundation

class GiftPresenter: BasePresenter {
  
  private var view: GiftView? {
    return baseView as? GiftView
  }
  
  var repository: GiftRepository
  
  init(repository: GiftRepository) {
    self.repository = repository
  }
  
  func attemptGift(){
    self.view?.showLoading()
    repository.getGifts(){ gifts in
      self.view?.hideLoading()
      self.view?.giftsSuccessFull(gifts)
    }
  }
}
