//
//  Auth.swift
//  acebook-ios
//
//  Created by Tom Mazzag on 23/02/2024.
//

import Foundation

struct UserLogin: Codable {
    let email: String
    let password: String
}

class userAuth: ObservableObject {
    
    func loginUser(user: UserLogin, completion: @escaping (Bool) -> Void) {
        let url = URL(string: "\(API_URL)/tokens")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        print(user)
        
        let data = try! JSONEncoder().encode(user)
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let requestData = request
        
        Task {
            do {
                let (tokenData, response) = try await URLSession.shared.data(for: requestData)
                let statusCode = (response as! HTTPURLResponse).statusCode
                
//              tokenData is returned an JSON object and the following code block extracts the token value
//              This translates the Json data to a dictionary
                guard let jsonToken = try? JSONSerialization.jsonObject(with: tokenData, options: []) as? [String: Any],
                      let tokenValue = jsonToken["token"] as? String else {
                    print("Unable to decode token data from JSON or no token data received")
                    return }
                token = tokenValue
                if statusCode == 201 {
                    print("OK: \(statusCode)")
                    completion(true)
                } else {
                    print("FAILURE: \(statusCode)")
                    completion(false)
                }
            } catch {
                print("Failed to Send POST Request \(error)")
                completion(false)
            }
        }
    }
}
