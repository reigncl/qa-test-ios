//
//  SitesTableViewCell.swift
//  wedding
//
//  Created by Abstract on 2/11/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import UIKit
import Kingfisher

class SitesTableViewCell: UITableViewCell {
  
  @IBOutlet var cardView: UIView!
  @IBOutlet var siteImageView: UIImageView!
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var addressLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    cardView.layer.shadowColor = UIColor.gray.cgColor
    cardView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
    cardView.layer.shadowRadius = 12.0
    cardView.layer.shadowOpacity = 0.7
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  func bind(_ site: Site) {
    siteImageView.kf.setImage(with: URL(string: site.picture))
    titleLabel.text = site.name
    addressLabel.text = site.address
  }
}

