//
//  WishesViewController.swift
//  wedding
//
//  Created by Abstract on 2/8/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import UIKit

class WishesViewController: BaseViewController<WishesPresenter>, WishesView, CreateWishDelegate {
  
  @IBOutlet var wishTableView: UITableView!
  
  var wishes = [Wish]()
  
  var dataSource: WishesTableViewDataSource?
  var delegate: WishesTableViewDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let barButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addWish))
    barButton.tintColor = UIColor.orangeEvent
    navigationItem.rightBarButtonItem = barButton
    
    dataSource = WishesTableViewDataSource(wishes: wishes)
    delegate = WishesTableViewDelegate(onWishSelected: { (index) in
      self.wireframe.showWishDetail(parent: self, wish: self.wishes[index])
    })
    
    wishTableView.dataSource = dataSource
    wishTableView.delegate = delegate
    
    presenter.attemptWishes()
  }
  
  @objc func addWish(){
    wireframe.showWishCreate(parent: self, listener: self)
  }
  
  func wishesSuccessfully(_ wishes: [Wish]) {
    self.wishes = wishes
    dataSource?.wishes = wishes
    wishTableView.reloadData()
  }
  
  func wishCreatedSuccessfully(_ wish: Wish) {
    self.wishes.append(wish)
    dataSource?.wishes.append(wish)
    wishTableView.reloadData()
  }
  
  func setComment(_ comment: String) {
    presenter.sendWish(comment)
  }
}
