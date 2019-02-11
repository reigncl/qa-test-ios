//
//  PhotosCollectionViewCell.swift
//  wedding
//
//  Created by Abstract on 2/11/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import UIKit
import Kingfisher

class PhotosCollectionViewCell: UICollectionViewCell {
    
  @IBOutlet var photoImageView: UIImageView!
  
  func bind(_ photo: Photo) {
    photoImageView.kf.setImage(with: URL(string: photo.url))
  }
}
