//
//  InvitationViewController.swift
//  wedding
//
//  Created by Abstract on 2/12/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import UIKit

class RegisterViewController: BaseViewController<RegisterPresenter>, RegisterView {
  
  @IBOutlet var nameTextField: UITextField!
  @IBOutlet var lastNameTextField: UITextField!
  @IBOutlet var codeTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func enterButtonPressed(_ sender: UIButton) {
    if nameTextField.text?.isEmpty ?? false {
      showAlertMessage("El campo de nombre no debe estar vacío.")
      return
    } else if lastNameTextField.text?.isEmpty ?? false {
      showAlertMessage("El campo de apellido no debe estar vacío.")
      return
    } else if codeTextField.text?.isEmpty ?? false {
      showAlertMessage("El campo de código no debe estar vacío.")
      return
    }
    
    if codeTextField.text != "230219" {
      showAlertMessage("El código es incorrecto.")
      return
    }
    
    presenter.logIn(nameTextField.text ?? "", lastName: lastNameTextField.text ?? "")
  }
  
  func registeredSuccessfully(_ user: User) {
    UserDefaults.standard.set(user.firstName, forKey: Constants.USER_NAME)
    UserDefaults.standard.set(user.id, forKey: Constants.USER_ID)
    UserDefaults.standard.set(user.lastName, forKey: Constants.USER_LAST_NAME)
    UserDefaults.standard.set(true, forKey: Constants.LOGGED_IN)
    UserDefaults.standard.synchronize()
    
    wireframe.tabBar().show()
  }
}
