//
//  PhotosView.swift
//  wedding
//
//  Created by Abstract on 2/11/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import Foundation

protocol PhotosView: BaseView {
  func photosSuccessfully(_ photos: [Photo])
}
