//
//  User.swift
//  SisteCreditoApp
//
//  Created by Giovanny Beltran on 8/02/23.
//

import Foundation

// MARK: - WelcomeElement
struct User: Codable, Hashable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

// MARK: - Address
struct Address: Codable, Hashable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Codable, Hashable {
    let lat, lng: String
}

// MARK: - Company
struct Company: Codable, Hashable {
    let name, catchPhrase, bs: String
}
