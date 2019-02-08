//
//  Site.swift
//  wedding
//
//  Created by Abstract on 2/8/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import Foundation
import Result
import Moya

class Site: Codable {
  var id: String = ""
  var name: String = ""
  var body: String = ""
  var address: String = ""
  var latitude: Double = 0.0
  var longitude: Double = 0.0
  var phone: String = ""
  var email: String = ""
  var secondPhone: String = ""
  var url: String = ""
  var picture: String = ""
  
  private enum CodingKeys: String, CodingKey {
    case id = "_id"
    case name
    case body = "description"
    case address
    case latitude
    case longitude
    case phone
    case email
    case secondPhone
    case url
    case picture
  }
}



