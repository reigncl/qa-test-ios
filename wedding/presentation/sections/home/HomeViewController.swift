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
  
  var timer = Timer()
  var seconds = 0
  
  override func viewWillAppear(_ animated: Bool) {
    timerLabel.text = "00h 00m 00s"
    let isoDate = "2019-02-23T14:00:00+0000"
    let date = Date.dateFromString(isoDate)
    
    let currentDate = Date.dateFromString(Date.currentDate())
    
    daysLabel.text = "\(Date.daysBetween(date1: currentDate ?? Date(), date2: date ?? Date()))d"
    seconds = Date.secondsBetween(date1: currentDate ?? Date(), date2: date ?? Date())
    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(HomeViewController.updateTimer)), userInfo: nil, repeats: true)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    timer.invalidate()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let tapImage = UITapGestureRecognizer(target: self, action: #selector(self.handleTapImage(_:)))
    homeImageView.addGestureRecognizer(tapImage)
  }
  
  @objc func handleTapImage(_ sender: UITapGestureRecognizer){
    wireframe.invitation().show()
  }
  
  @objc func updateTimer() {
    if seconds == 0 {
      daysLabel.text = "Falta muy poco!!!"
      timerLabel.text = "00h 00m 00s"
    } else {
      seconds -= 1
      timerLabel.text = timeString(time: TimeInterval(seconds))
    }
  }
  
  func timeString(time: TimeInterval) -> String {
    let hours = Int(time) / 3600 % 24
    let minutes = Int(time) / 60 % 60
    let seconds = Int(time) % 60
    return String(format: "%02ih %02im %02is", hours, minutes, seconds)
  }
}
