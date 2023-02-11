//
//  DataRepository.swift
//  SisteCreditoApp
//
//  Created by Giovanny Beltran on 8/02/23.
//

import Foundation

typealias DataUser = DataResult<[User]>
typealias DataUserDetail = DataResult<[Publication]>
                                        
protocol DataRepositoryProtocol {
    func getUsers(completion: @escaping (DataUser) -> Void)
    func getUserDetail(id: Int, completion: @escaping (DataUserDetail) -> Void)
}

class DataRepository: DataRepositoryProtocol {
    
    let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func getUsers(completion: @escaping (DataUser) -> Void) {
        let url = Constants.userUrl
        httpClient.request(url: url, completion: completion)
    }
    
    func getUserDetail(id: Int, completion: @escaping (DataUserDetail) -> Void) {
        let url = Constants.userDetailUrl+String(id)
        httpClient.request(url: url, completion: completion)
    }
}
