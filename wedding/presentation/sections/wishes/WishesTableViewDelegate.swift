//
//  WishesTableViewDelegate.swift
//  wedding
//
//  Created by Abstract on 2/11/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import Foundation
import UIKit

class WishesTableViewDelegate: NSObject, UITableViewDelegate {
  
  var onWishSelected: ((_ index: Int) -> Void)
  
  init(onWishSelected: @escaping ((_ index: Int) -> Void)) {
    self.onWishSelected = onWishSelected
    super.init()
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    onWishSelected(indexPath.row)
  }
}
