//
//  DetailSiteViewController.swift
//  wedding
//
//  Created by Ulises Harris on 2/11/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import UIKit
import Kingfisher
import MessageUI

class DetailSiteViewController: BaseViewController<BasePresenter>, MFMailComposeViewControllerDelegate {
  
  @IBOutlet var pictureImageView: UIImageView!
  @IBOutlet var bodyLabel: UILabel!
  @IBOutlet var mapImageView: UIImageView!
  @IBOutlet var addressLabel: UILabel!
  @IBOutlet var webPageView: UIView!
  @IBOutlet var emailView: UIView!
  @IBOutlet var emailLabel: UILabel!
  @IBOutlet var phoneView: UIView!
  @IBOutlet var phoneLabel: UILabel!
  @IBOutlet var gpsView: UIView!
  
  var site: Site?
  
  override func viewWillAppear(_ animated: Bool) {
    tabBarController?.tabBar.isHidden = true
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    tabBarController?.tabBar.isHidden = false
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.title = site?.name
    pictureImageView.kf.setImage(with: URL(string: site?.picture ?? ""))
    bodyLabel.attributedText = site?.body.html2AttributedString
    addressLabel.text = site?.address
    emailLabel.text = "Correo electrónico: \(site?.email ?? "")"
    phoneLabel.text = "Teléfono: \(site?.phone ?? "")"
    
    let mapUrl = "https://maps.google.com/maps/api/staticmap?sensor=false&key=AIzaSyA_C694olwHBRnGJ7ZaAvgZXKoxftPdHCQ&center=\(site?.latitude ?? 0.0)\(site?.longitude ?? 0.0)&zoom=16&size=800x300&scale=2&sensor=false&markers=color:red%7C\(site?.latitude ?? 0),\(site?.longitude ?? 0.0)"
    mapImageView.kf.setImage(with: URL(string: mapUrl))
    
    let tapWeb = UITapGestureRecognizer(target: self, action: #selector(self.handleTapWeb(_:)))
    webPageView.addGestureRecognizer(tapWeb)
    
    let tapEmail = UITapGestureRecognizer(target: self, action: #selector(self.handleTapEmail(_:)))
    emailView.addGestureRecognizer(tapEmail)
    
    let tapPhone = UITapGestureRecognizer(target: self, action: #selector(self.handleTapPhone(_:)))
    phoneView.addGestureRecognizer(tapPhone)
    
    let tapGps = UITapGestureRecognizer(target: self, action: #selector(self.handleTapGps(_:)))
    gpsView.addGestureRecognizer(tapGps)
  }
  
  @objc func handleTapWeb(_ sender: UITapGestureRecognizer) {
    if let url = URL(string: site?.url ?? "") {
      UIApplication.shared.open(url, options: [:])
    }
  }
  
  @objc func handleTapEmail(_ sender: UITapGestureRecognizer) {
    sendEmail()
  }
  
  @objc func handleTapPhone(_ sender: UITapGestureRecognizer) {
    let trimmedString = site?.phone.replacingOccurrences(of: " ", with: "")
    guard let number = URL(string: "tel://\(String(describing: trimmedString))" ) else { return }
    UIApplication.shared.open(number)
  }
  
  @objc func handleTapGps(_ sender: UITapGestureRecognizer) {
    if let url = URL(string: "https://maps.apple.com/?daddr=(\(site?.latitude ?? 0.0)),(\(site?.longitude ?? 0.0))") {
      UIApplication.shared.open(url, options: [:])
    }
    
  }
  
  func sendEmail() {
    if MFMailComposeViewController.canSendMail() {
      let mail = MFMailComposeViewController()
      mail.mailComposeDelegate = self
      mail.setToRecipients([site?.email ?? ""])
      
      present(mail, animated: true)
    } else {
      showSimpleAlert(message: "No tiene configurada su cuenta de correo electrónico.")
    }
  }
  
  func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
    controller.dismiss(animated: true)
  }
}
