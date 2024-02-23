//
//  Main.swift
//  acebook-ios
//
//  Created by Tom Mazzag on 16/02/2024.
//

import SwiftUI

var token = ""

struct Main: View {
    
    var body: some View {
        ZStack {
            TabView {
                PostView()
                    .tabItem() {
                        Image(systemName: "plus")
                        Text("Posts")
                    }
                UserView()
                    .tabItem() {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                AccountView()
                    .tabItem() {
                        Image(systemName: "person.crop.circle.fill")
                        Text("Account")
                    }
            }
        }
    }
}

#Preview {
    Main()
}
