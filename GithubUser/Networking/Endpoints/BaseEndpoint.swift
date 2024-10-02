//
//  BaseEndpoint.swift
//  GithubUser
//
//  Created by Dang Luan on 2024/08/05.
//

import Foundation
import Alamofire

// Endpoint class
public protocol BaseEndpoint {
    var url: String { get }
    var method: HTTPMethod { get }
    var params: [String: Any]? { get }
}
