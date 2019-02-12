//
//  GiftTableViewCell.swift
//  wedding
//
//  Created by Abstract on 2/12/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import UIKit

class GiftTableViewCell: UITableViewCell {
  
  @IBOutlet var giftView: UIView!
  @IBOutlet var bankLable: UILabel!
  @IBOutlet var numberLabel: UILabel!
  @IBOutlet var abaLabel: UILabel!
  @IBOutlet var swiftLabel: UILabel!
  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var addressLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    giftView.layer.shadowColor = UIColor.gray.cgColor
    giftView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
    giftView.layer.shadowRadius = 7.0
    giftView.layer.shadowOpacity = 0.5
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  func bind(_ gift: Gift) {
    bankLable.text = gift.bank
    numberLabel.text = gift.number
    abaLabel.text = gift.aba
    swiftLabel.text = gift.swift
    nameLabel.text = gift.name
    addressLabel.text = gift.address
  }
}
