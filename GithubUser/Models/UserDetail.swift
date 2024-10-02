//
//  UserDetail.swift
//  GithubUser
//
//  Created by Dang Luan on 2024/08/09.
//

import Foundation

//{
//    "login": "sbecker",
//    "id": 1001,
//    "node_id": "MDQ6VXNlcjEwMDE=",
//    "avatar_url": "https://avatars.githubusercontent.com/u/1001?v=4",
//    "gravatar_id": "",
//    "url": "https://api.github.com/users/sbecker",
//    "html_url": "https://github.com/sbecker",
//    "followers_url": "https://api.github.com/users/sbecker/followers",
//    "following_url": "https://api.github.com/users/sbecker/following{/other_user}",
//    "gists_url": "https://api.github.com/users/sbecker/gists{/gist_id}",
//    "starred_url": "https://api.github.com/users/sbecker/starred{/owner}{/repo}",
//    "subscriptions_url": "https://api.github.com/users/sbecker/subscriptions",
//    "organizations_url": "https://api.github.com/users/sbecker/orgs",
//    "repos_url": "https://api.github.com/users/sbecker/repos",
//    "events_url": "https://api.github.com/users/sbecker/events{/privacy}",
//    "received_events_url": "https://api.github.com/users/sbecker/received_events",
//    "type": "User",
//    "site_admin": false,
//    "name": "Scott Becker",
//    "company": "@olioapps",
//    "blog": "https://www.olioapps.com",
//    "location": null,
//    "email": null,
//    "hireable": null,
//    "bio": null,
//    "twitter_username": "sbecker",
//    "public_repos": 42,
//    "public_gists": 9,
//    "followers": 66,
//    "following": 24,
//    "created_at": "2008-02-26T23:03:22Z",
//    "updated_at": "2024-08-06T18:33:53Z"
//}
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
