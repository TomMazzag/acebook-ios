//
//  LoginView.swift
//  acebook-ios
//
//  Created by Tom Mazzag on 23/02/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .accessibilityIdentifier("makers-logo")
                    .padding(.top)
                Text("Acebook")
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .font(.largeTitle)
                
                
                VStack {
                    TextField("Email", text: $email)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1))
                    
                    
                    SecureField("Password", text: $password)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1))
                        .padding(.bottom, 20)
                    
                    Button("Login") {
                        let user = UserLogin(email: email, password: password)
                        let service = userAuth()
                        service.loginUser(user: user) { success in
                            if success {
                                email = ""
                                password = ""
                                isLoggedIn = true
                            } else {
                                print("Error logging in")
                            }
                        }
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .padding(.vertical, 10)
                        .foregroundColor(.white)
                        .frame(alignment: .center)
                        .background(.blue)
                        .cornerRadius(10)
                        .font(.title2)
                }
                .padding([.leading, .bottom, .trailing], 30.0)
                .padding(.top, 80)
                    
                
                .background(.clear)
                
                Spacer()
                
                NavigationLink(destination: SignUpView()) {
                    Text("Create a new account")
                        .padding(10)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(10)
                        .accessibilityIdentifier("signUpButton")
                }
                
            }
            .frame(maxHeight: .infinity)
        }
    }
}

#Preview {
    LoginView(isLoggedIn: .constant(false))
}
