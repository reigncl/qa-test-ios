//
//  Wish.swift
//  wedding
//
//  Created by Abstract on 2/8/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import Foundation
import Result
import Moya

class Wish: Codable {
  var id: String = ""
  var user: User = User()
  var comment: String = ""
  
  private enum CodingKeys: String, CodingKey {
    case id = "_id"
    case user
    case comment
  }
}
