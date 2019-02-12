//
//  GiftTableViewDataSource.swift
//  wedding
//
//  Created by Abstract on 2/12/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import Foundation
import UIKit

class GiftTableViewDataSource: NSObject, UITableViewDataSource {
  
  var gifts: [Gift]
  
  init(gifts: [Gift]) {
    self.gifts = gifts
    super.init()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return gifts.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let gift = self.gifts[indexPath.row]
    
    if let cell = tableView.dequeueReusableCell(withIdentifier: "GiftTableViewCell") as? GiftTableViewCell {
      cell.bind(gift)
      return cell
    }
    return UITableViewCell()
  }
}
