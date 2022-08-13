//
//  PostComponent.swift
//  CodingIsCool
//
//  Created by Sebastian Rodriguez on 8/12/22.
//

import SwiftUI

struct PostComponent: View {
    private let profile: String
    private let user: String
    private let content: String
    
    init(profile: String, user: String, content: String) {
        self.profile = profile
        self.user = user
        self.content = content
    }
    
    var body: some View {
        VStack {
            HStack() {
                Text(profile)
                Text(user)
                    .font(.title2.bold())
                Spacer()
            }
            Text(content)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct PostComponent_Previews: PreviewProvider {
    static var previews: some View {
        PostComponent(profile: "👾", user: "Username", content: "Testing Testing Testing Testing Testing Testing Testing")
    }
}
