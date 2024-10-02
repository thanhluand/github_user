//
//  UserEndPoint.swift
//  GithubUser
//
//  Created by Dang Luan on 2024/08/06.
//

import Foundation
import Alamofire

enum UserEndPoint: BaseEndpoint {
    
    case getUsers(since: Int, perPage: Int)
    case searchUsers(keyword: String, page: Int, perPage: Int)
    case userDetail(userName: String)
    case userRepos(userName: String)
    
    var url: String {
        switch self {
        case .getUsers:
            return "/users"
        case .searchUsers:
            return "/search/users"
        case .userDetail(let userName):
            return "/users/\(userName)"
        case .userRepos(let userName):
            return "/users/\(userName)/repos"
        }
        
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var params: [String: Any]?{
        switch self {
        case .getUsers(let since, let perPage):
            return [
                "since": since,
                "per_page": perPage
            ]
        case .searchUsers(let keyword, let page, let perPage):
            return [
                "q": keyword,
                "per_page": perPage,
                "page": page
            ]
        default:
            return [:]
        }
    }
    
}
