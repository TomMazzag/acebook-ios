//
//  Main.swift
//  acebook-ios
//
//  Created by Tom Mazzag on 16/02/2024.
//

import SwiftUI

struct Main: View {
    var body: some View {
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
        }
    }
}

#Preview {
    Main()
}
