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
    private let language: String
    
    init(profile: String, user: String, content: String, language: String) {
        self.profile = profile
        self.user = user
        self.content = content
        self.language = language
    }
    
    var body: some View {
        VStack {
            HStack() {
                Text(profile)
                    .font(.title3)
                Text(user)
                    .font(.title3.bold())
                Spacer()
            }
            Text(content)
            Text("In: \(language)")
                .font(.subheadline)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct PostComponent_Previews: PreviewProvider {
    static var previews: some View {
        PostComponent(profile: "👾", user: "Username", content: "Testing Testing Testing Testing Testing Testing Testing", language: "Python")
    }
}
