//
//  UserApi.swift
//  wedding
//
//  Created by Abstract on 2/8/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import Moya

public enum UserApi {
  case register(firstName: String, nickName: String, lastName: String)
}

extension UserApi: TargetType {
  public var baseURL: URL {
    return URL(string: "https://wedding-backend-app.herokuapp.com/")!
  }
  
  public var path: String {
    switch self {
    case .register: return "users"
    }
  }
  
  public var method: Moya.Method {
    switch self {
    case .register: return .post
    }
  }
  
  public var sampleData: Data {
    return Data()
  }
  
  public var task: Task {
    switch self {
    case .register(let firstName, let nickName, let lastName):
      return .requestParameters(parameters: ["firstName": firstName, "nickName": nickName,"lastName": lastName], encoding: JSONEncoding.default)
    }
  }
  
  public var headers: [String : String]? {
    return ["Content-Type": "application/json"]
  }
  
  public var validationType: ValidationType {
    return .successCodes
  }
}
