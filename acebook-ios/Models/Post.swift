//
//  Post.swift
//  acebook-ios
//
//  Created by Tom Mazzag on 23/02/2024.
//

import Foundation

struct Post: Codable, Identifiable {
    let id: String
    let message: String
    let full_name: String
    let profile_pic: String
    let created_at: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case message
        case full_name
        case profile_pic
        case created_at = "createdAt"
    }
    
    var formattedCreatedAt: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ" // Input format
        if let date = dateFormatter.date(from: created_at) { // If the date is valid / the corect format
            dateFormatter.dateFormat = "dd MM yyyy, HH:mm" // Format you want to return
            return dateFormatter.string(from: date)
        } else {
            return "Invalid Date"
        }
    }
}

struct PostResponse: Codable {
    let posts: [Post]
}
