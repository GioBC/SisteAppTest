//
//  HttpClient.swift
//  SisteCreditoApp
//
//  Created by Giovanny Beltran on 8/02/23.
//

import Foundation

typealias DataResult<Success> = Swift.Result<Success, HTTPClientError>

protocol HTTPClient {
    func request<T: Codable>(url: String, completion: @escaping (DataResult<T>) -> Void)
}

enum HTTPClientError: Swift.Error {
    case connectivity
    case serviceError
    case errorParser
    case badURL
    case coreDataError
    case emptyResults
}
