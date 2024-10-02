//
//  SearchUser.swift
//  GithubUser
//
//  Created by Dang Luan on 2024/08/10.
//

import Foundation

struct SearchUser: Decodable {
    var totalCount: Int
    var incompleteResults: Bool
    var items: [User]
    
    private enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.totalCount = try container.decode(Int.self, forKey: .totalCount)
        self.incompleteResults = try container.decode(Bool.self, forKey: .incompleteResults)
        self.items = try container.decode([User].self, forKey: .items)
    }
}
