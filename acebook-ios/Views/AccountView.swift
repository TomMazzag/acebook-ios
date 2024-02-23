//
//  AccountView.swift
//  acebook-ios
//
//  Created by Tom Mazzag on 23/02/2024.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        VStack {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 125, height: 160)
                .symbolRenderingMode(.hierarchical)
                .foregroundStyle(.blue)
            Text("Hello, Tom!")
        }
    }
}

#Preview {
    AccountView()
}
