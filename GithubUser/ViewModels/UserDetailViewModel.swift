//
//  UserDetailViewModel.swift
//  GithubUser
//
//  Created by Dang Luan on 2024/08/05.
//

import Foundation

protocol UserDetailViewModelDelegate: AnyObject {
    func didFetchUserInfo()
    func didFetchUserRepos()
}

class UserDetailViewModel {
    
    weak var delegate: UserDetailViewModelDelegate?
    
    var user: UserDetail?
    var resos: [Repository] = []
    
    func getUser(user: String) {
        APIClient.request(endpoint: UserEndPoint.userDetail(userName: user)) { [weak self] (result: Result<UserDetail, AppError>) in
            guard let self = self else { return }
            switch result {
                case .success(let data):
                    self.user = data
                    delegate?.didFetchUserInfo()
                print("Success call userDetail \(data)")
                case .failure(let error):
                    print("failure: \(error)")
                    // TODO: handle error here
                }
        }
    }
    
    func getListRepos(user: String) {
        APIClient.request(endpoint: UserEndPoint.userRepos(userName: user)) { [weak self] (result: Result<[Repository], AppError>) in
            guard let self = self else { return }
            switch result {
                case .success(let datas):
                    self.resos = datas
                    delegate?.didFetchUserRepos()
                print("Success call userDetail \(datas)")
                case .failure(let error):
                    print("failure: \(error)")
                    // TODO: handle error here
                }
        }
    }
    
    
}
