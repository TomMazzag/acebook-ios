//
//  UserView.swift
//  acebook-ios
//
//  Created by Tom Mazzag on 15/02/2024.
//

import SwiftUI

struct UserView: View {
    @ObservedObject var viewModel = UsersViewModel()
    @State var SearchFor = ""
    @State var errors = ""
    
    var body: some View {
        VStack {
            VStack {
                Text("Users Database")
                    .font(.title)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
            }
            .padding(.bottom, 10)
            .background(.blue)
            
            TextField("Enter username to find", text: $SearchFor)
                .onChange(of: SearchFor, {
                    errors = viewModel.fetchUsers(username: SearchFor)
                })
                .padding()
            
            if SearchFor == "" {
                Text("Search for a username")
                Spacer()
            } else if viewModel.usersList.isEmpty {
                if errors != "" {
                    Text(errors)
                        .foregroundColor(.red)
                } else {
                    Text("No users found")
                }
                Spacer()
            } else {
                
                List(viewModel.usersList) { user in
                    HStack() {
                        AsyncImage(url: URL(string: user.profile_pic)) { image in image.resizable()
                            .aspectRatio(contentMode: .fill) } placeholder: { Color.black } .frame(width: 100, height: 100) .clipShape(Circle())
                        
                        Spacer()
                        
                        VStack() {
                            Text(user.full_name)
                                .font(.headline)
                            Text("User id: \(user.id)")
                        }
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        
                    }
                }
            }
        }
    }
}

#Preview {
    UserView()
}
