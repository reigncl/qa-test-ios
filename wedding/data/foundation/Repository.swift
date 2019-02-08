//
//  Repository.swift
//  wedding
//
//  Created by Abstract on 2/8/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import Foundation
import Moya

class Repository<T: TargetType>: NSObject {
  
  internal let api: MoyaProvider<T>
  
  init(api: MoyaProvider<T>) {
    self.api = api
    super.init()
  }
}
