//
//  CreateWishViewController.swift
//  wedding
//
//  Created by Abstract on 2/11/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import UIKit

protocol CreateWishDelegate: class {
  func setComment(_ comment: String)
}

class CreateWishViewController: BasePopup {
  
  @IBOutlet var commentTextView: UITextView!
  var listener: CreateWishDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    showAnimate()
    commentTextView.becomeFirstResponder()
  }
  
  @IBAction func sendButtonPressed(_ sender: UIButton) {
    if commentTextView.text.isEmpty {
      showAlertMessage("Debe llenar el campo.")
    } else {
      removeAnimate()
      listener?.setComment(commentTextView.text)
    }
  }
}
