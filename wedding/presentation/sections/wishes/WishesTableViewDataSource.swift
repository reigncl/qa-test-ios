//
//  WishesTableViewDataSource.swift
//  wedding
//
//  Created by Abstract on 2/11/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import Foundation
import UIKit

class WishesTableViewDataSource: NSObject, UITableViewDataSource {
  
  var wishes: [Wish]
  
  init(wishes: [Wish]) {
    self.wishes = wishes
    super.init()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return wishes.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let wish = self.wishes[indexPath.row]
    
    if let cell = tableView.dequeueReusableCell(withIdentifier: "WishTableViewCell") as? WishTableViewCell {
      cell.bind(wish)
      return cell
    }
    return UITableViewCell()
  }
}
