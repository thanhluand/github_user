//
//  Repository.swift
//  GithubUser
//
//  Created by Dang Luan on 2024/08/09.
//

import Foundation

struct Repository: Decodable {
    var id: Int
    var name: String
    var htmlUrl: String
    var description: String?
    var fork: Bool
    var starCount: Int
    var watchersCount: Int
    var language: String?
    var createdAt: String
    var isExpand: Bool = false
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case fork
        case starCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case htmlUrl = "html_url"
        case language
        case createdAt = "created_at"
    }
    
    init(from decoder: any Decoder) throws {
        print(decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.fork = try container.decode(Bool.self, forKey: .fork)
        self.description = try container.decode(String?.self, forKey: .description)
        self.starCount = try container.decode(Int.self, forKey: .starCount)
        self.watchersCount = try container.decode(Int.self, forKey: .watchersCount)
        self.htmlUrl = try container.decode(String.self, forKey: .htmlUrl)
        self.language = try container.decode(String?.self, forKey: .language)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
    }
    
}
