//
//  PhotosPresenter.swift
//  wedding
//
//  Created by Abstract on 2/11/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import Foundation

class PhotosPresenter: BasePresenter {
  
  private var view: PhotosView? {
    return baseView as? PhotosView
  }
  
  var repository: PhotosRepository
  
  init(repository: PhotosRepository) {
    self.repository = repository
  }
  
  func attemptPhotos(){
    self.view?.showLoading()
    repository.getPhotos(){ photos in
      self.view?.hideLoading()
      self.view?.photosSuccessfully(photos)
    }
  }
}
