//
//  PhotosCollectionViewDelegate.swift
//  wedding
//
//  Created by Abstract on 2/11/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import Foundation
import UIKit

class PhotosCollectionViewDelegate: NSObject, UICollectionViewDelegateFlowLayout {
  
  var onPhotoSelected: ((_ index: Int) -> Void)
  
  init(onPhotoSelected: @escaping ((_ index: Int) -> Void)) {
    self.onPhotoSelected = onPhotoSelected
    super.init()
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    onPhotoSelected(indexPath.row)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let collectionViewSize = collectionView.frame.size.width - 16
    return CGSize(width: collectionViewSize/3, height: collectionViewSize/3)
  }
}
