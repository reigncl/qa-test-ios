//
//  PhotosRepository.swift
//  wedding
//
//  Created by Abstract on 2/8/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import Foundation
import UIKit

class PhotosRepository: Repository<PhotosApi> {
  
  func getPhotos(completion: ((_ photos: [Photo]) -> Void)?) {
    api.request(PhotosApi.getPhotos()) { result in
      if let data = result.value?.data {
        do {
          let decoder = JSONDecoder()
          let photos = try decoder.decode([Photo].self, from: data)
            completion?(photos)
        } catch let error {
          print(error)
        }
      }
    }
  }
  
  func uploadPhoto(title: String, image: UIImage, completion: ((_ photo: Photo?) -> Void)?){
    guard let data = image.jpegData(compressionQuality: 05)
      else {
        completion?(nil)
        return
    }
    api.request(PhotosApi.uploadPhoto(title: title, data)){ result in
      if let data = result.value?.data {
        do {
          let decoder = JSONDecoder()
          let photo = try decoder.decode(Photo.self, from: data)
          completion?(photo)
        } catch let error {
          print(error)
        }
      }
    }
  }
}
