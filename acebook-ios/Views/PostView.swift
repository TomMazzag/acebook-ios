//
//  PostView.swift
//  acebook-ios
//
//  Created by Tom Mazzag on 15/02/2024.
//

import SwiftUI

struct PostView: View {
    @ObservedObject var viewModel = PostsViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center) {
                Spacer()
                Text("Posts")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.leading, 10)
                
                Spacer()
                                 
                Button(action: {
                    print("Button tapped")
                }) {
                    Image(systemName: "magnifyingglass")
                }
                .foregroundColor(.white)
                .padding(.trailing, 5)
            }
            .padding(.bottom, 10)
            .background(.blue)
            
            if viewModel.postsList.isEmpty {
                Spacer()
                Text("Loading Posts")
                Spacer()
            } else {
                List(viewModel.postsList) { post in
                    VStack(alignment: .leading) {
                        HStack {
                            AsyncImage(url: URL(string: "\(post.profile_pic)")) { image in image.resizable()
                                .aspectRatio(contentMode: .fill) } placeholder: { Color.black } .frame(width: 60, height: 60) .clipShape(Circle())
                            VStack(alignment: .leading) {
                                Text(post.full_name)
                                    .font(.title)
                                Text(post.formattedCreatedAt)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .padding(.leading, 5)
                        }
                        .padding(.bottom, 10)
                        Text(post.message)
                        HStack {
                            Button(action: {
                                print("Like")
                            }) {
                                Image(systemName: "hand.thumbsup")
                            }.buttonStyle(BorderlessButtonStyle())
                            
                            Spacer()
                            
                            HStack {
                                Button("Comments") {
                                    print("Open comments section")
                                }.padding(.trailing, 10)
                                Button(action: {
                                    print("Share")
                                }) {
                                    Image(systemName: "square.and.arrow.up")
                                }.buttonStyle(BorderlessButtonStyle())
                            }
                        }
                        .padding(.top, 5)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.top, .bottom], 10)
                }
            }
        }
        .onAppear {
            print("Loading posts...")
            _ = viewModel.fetchPosts()
        }
    }
}

#Preview {
    PostView()
}
