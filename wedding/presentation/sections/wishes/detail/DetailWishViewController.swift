//
//  DetailWishViewController.swift
//  wedding
//
//  Created by Abstract on 2/11/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import UIKit

class DetailWishViewController: BasePopup {
  
  @IBOutlet var commentTextView: UITextView!
  @IBOutlet var nameLabel: UILabel!
  
  var wish: Wish?
  
  override func viewDidLoad() {
    showAnimate()
    super.viewDidLoad()
    
    commentTextView.text = wish?.comment
    nameLabel.text = "\(wish?.user?.firstName ?? "") \(wish?.user?.lastName ?? "")"
  }
  
  @IBAction func closeButtonPressed(_ sender: UIButton) {
    removeAnimate()
  }
}
