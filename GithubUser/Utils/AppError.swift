//
//  Errorhandling.swift
//  GithubUser
//
//  Created by Dang Luan on 2024/08/05.
//

import Foundation

enum AppError: Error {
    case networkError(String)
    case parsingError(String)
    case unknownError(String)
}

extension AppError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .networkError(let message):
            return NSLocalizedString("Network Error: \(message)", comment: "")
        case .parsingError(let message):
            return NSLocalizedString("Parsing Error: \(message)", comment: "")
        case .unknownError(let message):
            return NSLocalizedString("Unknown Error: \(message)", comment: "")
        }
    }
}
