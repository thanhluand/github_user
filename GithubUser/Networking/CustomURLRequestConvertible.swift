//
//  CustomURLRequestConvertible.swift
//  GithubUser
//
//  Created by Dang Luan on 2024/08/05.
//

import Foundation
import Alamofire

class CustomURLConvertible: URLConvertible {
  
  let path: String
  let baseUrl: String
  
  init(path: String, baseUrl: String) {
    self.path = path
    self.baseUrl = baseUrl
  }
  
  func asURL() throws -> URL {
      try "\(baseUrl)\(path)".asURL()
  }
}

class CustomURLRequestConvertible: URLRequestConvertible {
    let url: URLConvertible
    let method: HTTPMethod
    let headers: HTTPHeaders
    let params: [String: Any]?
    let encoding: ParameterEncoding?
    
    func asURLRequest() throws -> URLRequest {
        let request = try URLRequest(url: url, method: method, headers: headers)
        if let params = params, let encoding = encoding {
            return try encoding.encode(request, with: params)
        }
        return request
    }
    
    init(path: String, baseUrl: String, method: HTTPMethod, headers: HTTPHeaders, params: [String : Any]?, encoding: ParameterEncoding?) {
        url = CustomURLConvertible(path: path, baseUrl: baseUrl)
        self.method = method
        self.headers = headers
        self.params = params
        self.encoding = encoding
    }
}
