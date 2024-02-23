//
//  User.swift
//  acebook-ios
//
//  Created by Tom Mazzag on 23/02/2024.
//

import Foundation

struct User: Codable, Identifiable {
    let id: String
    let profile_pic: String
    let full_name: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case profile_pic
        case full_name
    }
}

struct UsersResponse: Codable {
    let users: [User]
}
