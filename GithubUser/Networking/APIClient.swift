//
//  APIClient.swift
//  GithubUser
//
//  Created by Dang Luan on 2024/08/04.
//

import Foundation
import Alamofire

public typealias SuccessCallback = (_ responseObject: [[String: Any]]) -> Void

public typealias FailureCallback = (_ error: Error) -> Void

class APIClient {
    
    enum HTTPHeader: String {
        case token = "access-token"
        case accept = "Accept"
        case userAgent = "User-Agent"
        case apiVersion = "X-GitHub-Api-Version"
    }
    
    
    static let baseHeaders: [String: String] = [
        HTTPHeader.accept.rawValue: Constants.API.Accept,
        HTTPHeader.userAgent.rawValue: Constants.API.UserAgent,
        HTTPHeader.apiVersion.rawValue: Constants.API.APIVersion,
        HTTPHeader.token.rawValue: "Bearer \(Constants.API.UserToken)"
    ]
    
    
    class func request<T: Decodable>(
        endpoint: BaseEndpoint,
        completion: @escaping (Result<T, AppError>) -> Void
    ) {
        let encoding = URLEncoding.default
        let headers = HTTPHeaders(APIClient.baseHeaders)
        
        let requestConvertible = CustomURLRequestConvertible(path: endpoint.url, baseUrl: Constants.API.BaseUrl, method: endpoint.method, headers: headers, params: endpoint.params, encoding: encoding)
        
        let request = AF.request(requestConvertible)
        
        request.responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                
                let appError = AppError.networkError(error.localizedDescription)
                ErrorHandler.shared.handleError(appError)
                if let str = String(data: response.data ?? Data(), encoding: .utf8) {
                    print("error content: \(str)")
                }
                completion(.failure(appError))
                
            }
        }
    }
    
    
}
