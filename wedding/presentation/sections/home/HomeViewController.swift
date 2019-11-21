//
//  HomeViewController.swift
//  wedding
//
//  Created by Abstract on 2/8/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController<BasePresenter> {
  
  @IBOutlet var daysLabel: UILabel!
  @IBOutlet var timerLabel: UILabel!
  @IBOutlet var homeImageView: UIImageView!
  @IBOutlet var timeView: UIView!
  
  override func viewDidLayoutSubviews() {
    timeView.layer.shadowColor = UIColor.gray.cgColor
    timeView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
    timeView.layer.shadowRadius = 7.0
    timeView.layer.shadowOpacity = 0.5
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    daysLabel.text = "19"
    timerLabel.text = "Días faltan para el evento"
  }
}
