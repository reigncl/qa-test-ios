//
//  WishTableViewCell.swift
//  wedding
//
//  Created by Abstract on 2/11/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import UIKit

class WishTableViewCell: UITableViewCell {

  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var commentLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

  func bind(_ wish: Wish) {
    nameLabel.text = "\(wish.user?.firstName ?? "") \(wish.user?.lastName ?? "")"
    commentLabel.text = wish.comment
  }
}
