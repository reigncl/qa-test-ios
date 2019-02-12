//
//  DataModule.swift
//  wedding
//
//  Created by Abstract on 2/8/19.
//  Copyright © 2019 uharris. All rights reserved.
//

// swiftlint:disable function_body_length

import Swinject
import Moya

class DataModule {
  static func setup(_ defaultContainer: Container) {
    
    defaultContainer.register(UserRepository.self) { r in
      UserRepository(api: getMoyaProvider())}
      .inObjectScope(.container)
    
    defaultContainer.register(SitesRepository.self) { r in
      SitesRepository(api: getMoyaProvider())}
      .inObjectScope(.container)
    
    defaultContainer.register(PhotosRepository.self) { r in
      PhotosRepository(api: getMoyaProvider())}
      .inObjectScope(.container)
    
    defaultContainer.register(WishesRepository.self) { r in
      WishesRepository(api: getMoyaProvider())}
      .inObjectScope(.container)
    
    defaultContainer.register(GiftRepository.self) { r in
      GiftRepository()}.inObjectScope(.container)
    
    defaultContainer.register(URLSessionConfiguration.self) { _ in
      let config = URLSessionConfiguration.default
      config.httpCookieStorage = HTTPCookieStorage.shared
      config.httpCookieAcceptPolicy = .always
      config.httpShouldSetCookies = true
      return config
      }.inObjectScope(.container)
    
    func getMoyaProvider<T: TargetType>() -> MoyaProvider<T> {
      
      let config = defaultContainer.resolve(URLSessionConfiguration.self)!
      let manager = Moya.Manager(configuration: config)
      
      return MoyaProvider<T>(endpointClosure: { (target: T) in
        
        let url = "\(target.baseURL.absoluteString)\(target.path)"
        
        let endpoint = Endpoint(
          url: url,
          sampleResponseClosure: { .networkResponse(200, target.sampleData) },
          method: target.method,
          task: target.task,
          httpHeaderFields: target.headers)
        
        return endpoint
      }, manager: manager)
    }
  }
}
