//
//  UserDataViewModel.swift
//  SisteCreditoApp
//
//  Created by Giovanny Beltran on 8/02/23.
//

import Foundation
import SwiftUI

class UserDataViewModel: ObservableObject {
    
   // var userObject: [UserObject] = []
    
    @Published var filtereUsers: [User] = []
    @Published var users: [User] = []
    @Published var userDetail: [Publication] = []
    @Published var activityIndicator: Bool = true
    @Published var searchText: String = ""
    
    let repository: DataRepositoryProtocol
    init(repository: DataRepositoryProtocol) {
        self.repository = repository
    }
    
    func getUsers() {
        self.activityIndicator = true
        repository.getUsers { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let users):
                self.users = users
                self.users = users
                self.filtereUsers = users
                self.activityIndicator = false
            case .failure(let error):
                print(error)
                self.activityIndicator = false
            }
        }
    }
    
    func getUserDetail(id: Int) {
        self.activityIndicator = true
        repository.getUserDetail(id: id) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let userDetail):
                self.userDetail = userDetail
                self.activityIndicator = false
            case .failure(let error):
                print(error)
                self.activityIndicator = false
            }
        }
    }
}
