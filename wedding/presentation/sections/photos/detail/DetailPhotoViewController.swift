//
//  DetailPhotoViewController.swift
//  wedding
//
//  Created by Abstract on 2/11/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import UIKit
import Kingfisher

class DetailPhotoViewController: BaseViewController<BasePresenter> {
  
  @IBOutlet var photoImageView: UIImageView!
  @IBOutlet var titleLabel: UILabel!
  
  var photo: Photo?
  
  override func viewWillAppear(_ animated: Bool) {
    navigationController?.navigationBar.isHidden = true
    tabBarController?.tabBar.isHidden = true
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    navigationController?.navigationBar.isHidden = false
    tabBarController?.tabBar.isHidden = false
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    titleLabel.text = photo?.title ?? ""
    photoImageView.kf.setImage(with: URL(string: photo?.url ?? ""))
  }
  
  @IBAction func closeButtonPressed(_ sender: UIButton) {
    wireframe.popCurrentScreen()
  }
}
