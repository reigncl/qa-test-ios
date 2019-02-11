//
//  SitesTableViewDataSource.swift
//  wedding
//
//  Created by Abstract on 2/11/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import Foundation
import UIKit

class SitesTableViewDataSource: NSObject, UITableViewDataSource {
  
  var sites: [Site]
  
  init(sites: [Site]) {
    self.sites = sites
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sites.count == 0 ? 0 : 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let site = self.sites[indexPath.row + indexPath.section]
    
    if let cell = tableView.dequeueReusableCell(withIdentifier: "SitesTableViewCell") as? SitesTableViewCell {
      cell.bind(site)
      return cell
    }
    return UITableViewCell()
  }
}
