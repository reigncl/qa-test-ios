//
//  WishesView.swift
//  wedding
//
//  Created by Abstract on 2/11/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import Foundation

protocol WishesView: BaseView {
  func wishesSuccessfully(_ wishes: [Wish])
  func wishCreatedSuccessfully(_ wish: Wish)
}
