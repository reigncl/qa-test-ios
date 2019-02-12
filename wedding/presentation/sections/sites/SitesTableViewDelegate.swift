//
//  SitesTableViewDelegate.swift
//  wedding
//
//  Created by Abstract on 2/11/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import Foundation
import UIKit

class SitesTableViewDelegate: NSObject, UITableViewDelegate {
  
  var onSiteSelected: ((_ index: Int) -> Void)
  
  init(onSiteSelected: @escaping ((_ index: Int) -> Void)) {
    self.onSiteSelected = onSiteSelected
    super.init()
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    onSiteSelected(indexPath.row + indexPath.section)
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let  headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell") as! HeaderTableViewCell
    
    switch (section) {
    case 0:
      headerCell.bind(title: "Ceremonia")
    case 1:
      headerCell.bind(title: "Recepción")
    default:
      headerCell.bind(title: "Ceremonia")
    }
    
    return headerCell
  }
}
