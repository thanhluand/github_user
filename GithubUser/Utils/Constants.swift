//
//  Constants.swift
//  GithubUser
//
//  Created by Dang Luan on 2024/08/04.
//

import Foundation

struct Constants {
    struct Common {
        static let AppName = "Github User"
        static let MaxRequestItem = 50
    }
    
    struct API {
        static let APIVersion = "2022-11-28"
        static let UserAgent = "GithubUser"
        static let UserToken = ""
        static let Accept = "application/vnd.github+json"
        static let BaseUrl = "https://api.github.com"
    }
}
