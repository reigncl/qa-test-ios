//
//  AddPhotoViewController.swift
//  wedding
//
//  Created by Abstract on 2/11/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import UIKit

protocol AddPhotoDelegate: class {
  func addPhotoCollection(_ photo: Photo)
}

class AddPhotoViewController: BaseViewController<AddPhotoPresenter>, AddPhotoView, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  @IBOutlet var photoImageView: UIImageView!
  @IBOutlet var titleTextField: UITextField!
  
  var picker = UIImagePickerController()
  var image: UIImage?
  
  var delegate: AddPhotoDelegate?
  
  override func viewWillAppear(_ animated: Bool) {
    tabBarController?.tabBar.isHidden = true
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    tabBarController?.tabBar.isHidden = false
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    picker.delegate = self
    
    let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTapImageView(_:)))
    photoImageView.addGestureRecognizer(tap)
  }
  
  @objc func handleTapImageView(_ sender: UITapGestureRecognizer) {
    presenter.chooseProfilePicture(view: self, imagePicker: picker)
  }
  
  @IBAction func sendButtonPressed(_ sender: UIButton) {
    if let empty = titleTextField.text?.isEmpty {
      if empty {
        showAlertMessage("Por favor, coloque el título.")
      } else {
        if image == nil {
          showAlertMessage("Por favor, seleccioné una imagen.")
        } else {
          presenter.attemptAddPhoto(titleTextField.text ?? "", image: image ?? UIImage())
        }
      }
    }
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let chosenImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
      image = chosenImage
      photoImageView.image = image
    }
    wireframe.dismissController(animated: true, completion: nil)
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    wireframe.dismissController(animated: true, completion: nil)
  }
  
  func addPhotoSuccessfully(_ photo: Photo) {
    delegate?.addPhotoCollection(photo)
    wireframe.popCurrentScreen()
  }
}
