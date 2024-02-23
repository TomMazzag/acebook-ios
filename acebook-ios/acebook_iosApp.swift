//
//  acebook_iosApp.swift
//  acebook-ios
//
//  Created by Tom Mazzag on 15/02/2024.
//

import SwiftUI

@main
struct acebook_iosApp: App {
    
    @State private var isLoggedIn = false
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if isLoggedIn {
                    Main()
                } else {
                    LoginView(isLoggedIn: $isLoggedIn)
                }
            }
        }
    }
}
