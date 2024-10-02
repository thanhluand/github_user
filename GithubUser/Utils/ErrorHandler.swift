//
//  ErrorHandler.swift
//  GithubUser
//
//  Created by Dang Luan on 2024/08/05.
//

import Foundation

class ErrorHandler {
    static let shared = ErrorHandler()
    
    private init() {}
    
    func handleError(_ error: Error) {
        if let appError = error as? AppError {
            logError(appError)
        } else {
            logError(AppError.unknownError(error.localizedDescription))
        }
    }
    
    private func logError(_ error: AppError) {
        print("Error: \(error.localizedDescription)")
        
    }
}
