//
//  User.swift
//  GithubUser
//
//  Created by Dang Luan on 2024/08/06.
//

import Foundation

struct User: Decodable {
    var login: String
    var id: Int
    var avatar: String
    var type: String
    var url: String
    
    private enum CodingKeys: String, CodingKey {
        case login
        case id
        case type
        case url
        case avatar = "avatar_url"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.login = try container.decode(String.self, forKey: .login)
        self.id = try container.decode(Int.self, forKey: .id)
        self.avatar = try container.decode(String.self, forKey: .avatar)
        self.type = try container.decode(String.self, forKey: .type)
        self.url = try container.decode(String.self, forKey: .url)
    }
}
