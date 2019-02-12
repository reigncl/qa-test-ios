//
//  GiftViewController.swift
//  wedding
//
//  Created by Abstract on 2/8/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import UIKit

class GiftViewController: BaseViewController<GiftPresenter>, GiftView {
  
  @IBOutlet var giftTableView: UITableView!
  
  var dataSource: GiftTableViewDataSource?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    dataSource = GiftTableViewDataSource(gifts: [Gift]())
    
    giftTableView.dataSource = dataSource
    
    presenter.attemptGift()
  }
  
  func giftsSuccessFull(_ gifts: [Gift]) {
    dataSource?.gifts = gifts
    giftTableView.reloadData()
  }
}
