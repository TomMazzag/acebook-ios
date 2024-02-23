//
//  PostViewModel.swift
//  acebook-ios
//
//  Created by Tom Mazzag on 16/02/2024.
//

import Foundation

class PostsViewModel: ObservableObject {
    @Published var postsList: [Post] = []
    
    func fetchPosts() -> String {
        guard let url = URL(string: "\(API_URL)/posts/all/5") else { return "Couldnt get url" }
        
        let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjViYTZmZmJlODA3YThiNDJhOGU1M2JjIiwiaWF0IjoxNzA4NzE3ODIyLCJleHAiOjE3MDg4MDQyMjJ9.zzaEEdtTILlbK5wwOWdkUjBmKkjNZfsnipXg-hDluSo"
        
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
