//
//  UserView.swift
//  acebook-ios
//
//  Created by Tom Mazzag on 15/02/2024.
//

import Foundation

class UsersViewModel: ObservableObject {
    @Published var usersList: [User] = []

    func fetchUsers(username: String?) -> String {
        guard let user = username, !user.isEmpty else {
            print("No user")
            return "No user"
        }
        
        //ProcessInfo.processInfo.environment["API_URL"] else { return "No API URL" }
        
        let api = API_URL 
        
        guard let url = URL(string: "\(String(api))/users/search/\(user)") else { return "Couldnt get url" }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }

            do {
                let usersResponse = try JSONDecoder().decode(UsersResponse.self, from: data)
                DispatchQueue.main.async {
                    self.usersList = usersResponse.users
                }
            } catch {
                print("Error decoding users: \(error)")
            }
        }.resume()
        return ""
    }
}
