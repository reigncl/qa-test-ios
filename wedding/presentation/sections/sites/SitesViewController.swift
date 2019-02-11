//
//  SitesViewController.swift
//  wedding
//
//  Created by Abstract on 2/8/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import UIKit

class SitesViewController: BaseViewController<SitesPresenter>, SitesView {
  
  @IBOutlet var siteTableView: UITableView!
  
  var dataSource: SitesTableViewDataSource?
  var delegate: SitesTableViewDelegate?
  
  var sites = [Site]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    dataSource = SitesTableViewDataSource(sites: sites)
    delegate = SitesTableViewDelegate()
    
    siteTableView.dataSource = dataSource
    siteTableView.delegate = delegate
    
    presenter.attemptSites()
  }
  
  func sitesSuccessfully(_ sites: [Site]) {
    dataSource?.sites = sites
    siteTableView.reloadData()
  }
}
