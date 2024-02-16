//
//  PostViewModel.swift
//  acebook-ios
//
//  Created by Tom Mazzag on 16/02/2024.
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
}

struct PostResponse: Codable {
    let posts: [Post]
}

class PostsViewModel: ObservableObject {
    @Published var postsList: [Post] = []
    
    func fetchPosts() -> String {
        guard let url = URL(string: "\(API_URL)/posts/all/5") else { return "Couldnt get url" }
        
        let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjVjZTI0NGU5YWYxMjQ5MmQzOGU0ZmEyIiwiaWF0IjoxNzA4MDgxMTk0LCJleHAiOjE3MDgxNjc1OTR9.XDNS0s_7oxdvjp1R0o7voFITUU8vEFr3XFUCwDpXH1s"
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else { return }
            
            do {
                let response = try JSONDecoder().decode(PostResponse.self, from: data)
                DispatchQueue.main.async {
                    self.postsList = response.posts
                }
            } catch {
                print("Error decoding posts: \(error)")
            }
        }.resume()
        
        return ""
    }
}
