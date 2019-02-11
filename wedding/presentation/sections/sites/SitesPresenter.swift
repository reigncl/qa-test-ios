//
//  SitesPresenter.swift
//  wedding
//
//  Created by Abstract on 2/11/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import Foundation

class SitesPresenter: BasePresenter {
  
  private var view: SitesView? {
    return baseView as? SitesView
  }
  
  var repository: SitesRepository
  
  init(repository: SitesRepository) {
    self.repository = repository
  }
  
  func attemptSites(){
    self.view?.showLoading()
    repository.getSites(){ sites in
      self.view?.hideLoading()
      self.view?.sitesSuccessfully(sites)
    }
  }
}
