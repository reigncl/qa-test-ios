//
//  WishesApi.swift
//  wedding
//
//  Created by Abstract on 2/8/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import Moya

public enum WishesApi {
  case getWishes()
  case sendWish(user: String, comment: String)
}

extension WishesApi: TargetType {
  public var baseURL: URL {
    return URL(string: "https://wedding-backend-app.herokuapp.com/")!
  }
  
  public var path: String {
    return "wishes"
  }
  
  public var method: Moya.Method {
    switch self {
    case .getWishes: return .get
    case .sendWish: return .post
    }
  }
  
  public var sampleData: Data {
    return Data()
  }
  
  public var task: Task {
    switch self {
    case .getWishes: return .requestPlain
    case .sendWish(let user, let comment):
      return .requestParameters(parameters: ["user": user, "comment": comment], encoding: JSONEncoding.default)
    }
  }
  
  public var headers: [String : String]? {
    return ["Content-Type": "application/json"]
  }
  
  public var validationType: ValidationType {
    return .successCodes
  }
}
