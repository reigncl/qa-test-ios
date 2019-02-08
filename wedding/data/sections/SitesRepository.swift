//
//  SitesRepository.swift
//  wedding
//
//  Created by Abstract on 2/8/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import Foundation

class SitesRepository: Repository<SitesApi> {
  
  func getSites(completion: ((_ sites: [Site]) -> Void)?) {
    api.request(SitesApi.getSites()) { result in
      if let data = result.value?.data {
        do {
          let decoder = JSONDecoder()
          let sites = try decoder.decode([Site].self, from: data)
          completion?(sites)
        } catch let error {
          print(error)
        }
      }
    }
  }
}
