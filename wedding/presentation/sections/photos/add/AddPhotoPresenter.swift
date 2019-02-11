//
//  AddPhotoPresenter.swift
//  wedding
//
//  Created by Abstract on 2/11/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import Foundation
import UIKit

class AddPhotoPresenter: BasePresenter {
  private var view: AddPhotoView? {
    return baseView as? AddPhotoView
  }
  
  var repository: PhotosRepository
  var mediaUtils: MediaUtils
  
  init(repository: PhotosRepository, mediaUtils: MediaUtils) {
    self.repository = repository
    self.mediaUtils = mediaUtils
  }
  
  func chooseProfilePicture(view: UIViewController, imagePicker: UIImagePickerController) {
    mediaUtils.choosePicture(view: view, imagePicker: imagePicker)
  }
  
  func attemptAddPhoto(_ title: String, image: UIImage){
    self.view?.showLoading()
    repository.uploadPhoto(title: title, image: image){ photo in
      self.view?.hideLoading()
      self.view?.addPhotoSuccessfully(photo ?? Photo())
    }
  }
}
