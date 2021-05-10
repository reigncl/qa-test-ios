//
//  SitesApi.swift
//  wedding
//
//  Created by Abstract on 2/8/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import Moya

public enum SitesApi {
  case getSites()
}

extension SitesApi: TargetType {
  public var baseURL: URL {
    return URL(string: "https://qa-test-backend.reign.dev/")!
  }
  
  public var path: String {
    switch self {
    case .getSites: return "sites"
    }
  }
  
  public var method: Moya.Method {
    switch self {
    case .getSites: return .get
    }
  }
  
  public var sampleData: Data {
    return Data()
  }
  
  public var task: Task {
    switch self {
    case .getSites: return .requestPlain
    }
  }
  
  public var headers: [String : String]? {
    return ["Content-Type": "application/json"]
  }
  
  public var validationType: ValidationType {
    return .successCodes
  }
}
