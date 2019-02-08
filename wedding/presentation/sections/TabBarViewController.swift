//
//  TabBarViewController.swift
//  wedding
//
//  Created by Abstract on 2/8/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
      // remove default border
      tabBar.frame.size.width = self.view.frame.width + 4
      tabBar.frame.origin.x = -2
    }
}
