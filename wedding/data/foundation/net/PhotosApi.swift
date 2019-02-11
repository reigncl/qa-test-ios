//
//  PhotosApi.swift
//  wedding
//
//  Created by Abstract on 2/8/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import Moya

public enum PhotosApi {
  case getPhotos()
  case uploadPhoto(title: String, Data)
}

extension PhotosApi: TargetType {
  public var baseURL: URL {
    return URL(string: "https://wedding-backend-develop.herokuapp.com/")!
  }
  
  public var path: String {
    return "photos"
  }
  
  public var method: Moya.Method {
    switch self {
    case .getPhotos:
      return .get
    case .uploadPhoto:
      return .post
    }
  }
  
  public var sampleData: Data {
    return Data()
  }
  
  public var task: Task {
    switch self {
    case .getPhotos: return .requestPlain
    case .uploadPhoto(let title, let data):
      let titleData = MultipartFormData(provider: .data(title.data(using: .utf8) ?? Data()),
                                      name: "title")
      let imageData = MultipartFormData(provider: .data(data),
                                        name: "photo", fileName: "image_\(Date().timeIntervalSince1970).png", mimeType: "image/png")
      let multipartData = [titleData, imageData]
      return .uploadMultipart(multipartData)
    }
  }
  
  public var headers: [String : String]? {
    switch self {
    case .getPhotos: return ["Content-type": "application/json"]
    default:
      return [:]
    }
    
  }
}
