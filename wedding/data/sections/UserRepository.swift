//
//  UserRepository.swift
//  wedding
//
//  Created by Abstract on 2/8/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import Foundation

class UserRepository: Repository<UserApi> {
  
  func logIn(firstName: String, nickName: String, lastName: String, completion: ((_ user: User) -> Void)?) {
    api.request(UserApi.register(firstName: firstName, nickName: nickName, lastName: lastName)) { result in
      if let data = result.value?.data {
        do {
          let decoder = JSONDecoder()
          let user = try decoder.decode(User.self, from: data)
          completion?(user)
        } catch let error {
          print(error)
        }
      }
    }
  }
}
