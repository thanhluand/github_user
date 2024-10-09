//
//  UserDetail.swift
//  GithubUser
//
//  Created by Dang Luan on 2024/08/09.
//

import Foundation

struct UserDetail: Decodable {
    var login: String
    var id: Int
    var avatar: String
    var followers: Int
    var following: Int
    var name: String
    
    private enum CodingKeys: String, CodingKey {
        case login
        case id
        case followers
        case following
        case name
        case avatar = "avatar_url"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.login = try container.decode(String.self, forKey: .login)
        self.id = try container.decode(Int.self, forKey: .id)
        self.followers = try container.decode(Int.self, forKey: .followers)
        self.following = try container.decode(Int.self, forKey: .following)
        self.avatar = try container.decode(String.self, forKey: .avatar)
        self.name = try container.decode(String.self, forKey: .name)
    }
}
