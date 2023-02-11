//
//  Publication.swift
//  SisteCreditoApp
//
//  Created by Giovanny Beltran on 8/02/23.
//

import Foundation

// MARK: - WelcomeElement
struct Publication: Codable , Hashable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
