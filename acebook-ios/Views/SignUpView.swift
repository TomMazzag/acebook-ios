//
//  SignUpView.swift
//  acebook-ios
//
//  Created by Tom Mazzag on 23/02/2024.
//

import SwiftUI

struct SignUpView: View {
    @State public var username = ""
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .accessibilityIdentifier("makers-logo")
                
                Form {
                    Section {
                        TextField("Username", text: $username)
                    }
                    
                    Section {
                        TextField("Email", text: $email)
                            .autocapitalization(.none)
                    }
                    
                    Section {
                        SecureField("Password", text: $password)
                        SecureField("Verify Password", text: $password)
                    }
                    
                    Button("Create an account") {
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(.blue)
                    .listRowBackground(Color.blue)
                }
            }
        }
    }
}

#Preview {
    SignUpView()
}
