//
//  User.swift
//  wedding
//
//  Created by Abstract on 2/8/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import Foundation
import Result
import Moya

class User: Codable {
  var id: Int = 0
  var firstName: String = ""
  var nickName: String = ""
  var lastName: String = ""
  
  private enum CodingKeys: String, CodingKey {
    case id = "_id"
    case firstName
    case nickName
    case lastName
  }
}
