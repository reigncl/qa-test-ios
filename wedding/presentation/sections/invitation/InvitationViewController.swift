//
//  InvitationViewController.swift
//  wedding
//
//  Created by Abstract on 2/12/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import UIKit

class InvitationViewController: UIViewController {
  
  override func viewWillAppear(_ animated: Bool) {
    tabBarController?.tabBar.isHidden = true
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    tabBarController?.tabBar.isHidden = false
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
