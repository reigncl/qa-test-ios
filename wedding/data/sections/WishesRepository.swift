//
//  WishesRepository.swift
//  wedding
//
//  Created by Abstract on 2/8/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import Foundation

class WishesRepository: Repository<WishesApi> {
  
  func getWishes(completion: ((_ wishes: [Wish]) -> Void)?) {
    api.request(WishesApi.getWishes()) { result in
      if let data = result.value?.data {
        do {
          let decoder = JSONDecoder()
          let wishes = try decoder.decode([Wish].self, from: data)
          completion?(wishes)
        } catch let error {
          print(error)
        }
      }
    }
  }
  
  func sendWish(user: String, comment: String, completion: ((_ wish: Wish) -> Void)?){
    api.request(WishesApi.sendWish(user: user, comment: comment)){ result in
      if let data = result.value?.data {
        do {
          let decoder = JSONDecoder()
          let wish = try decoder.decode(Wish.self, from: data)
          completion?(wish)
        } catch let error {
          print(error)
        }
      }
    }
  }
}
