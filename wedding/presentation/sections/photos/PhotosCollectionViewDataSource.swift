//
//  PhotosCollectionViewDataSource.swift
//  wedding
//
//  Created by Abstract on 2/11/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import Foundation
import UIKit

class PhotosCollectionViewDataSource: NSObject, UICollectionViewDataSource {
  
  var photos: [Photo]
  
  init(photos: [Photo]) {
    self.photos = photos
    super.init()
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return photos.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let photo = self.photos[indexPath.row]
    
    if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCollectionViewCell", for: indexPath) as? PhotosCollectionViewCell {
      cell.bind(photo)
      return cell
    }
    return UICollectionViewCell()
  }
}
