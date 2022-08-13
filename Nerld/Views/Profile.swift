//
//  Personal.swift
//  CodingIsCool
//
//  Created by Sebastian Rodriguez on 8/12/22.
//

import SwiftUI

struct Profile: View {
    @State private var user: String = ""
    @State private var profile: String = "👾"
    private let profilePick: [String] = ["👽", "👻", "👾", "🤠", "🤡", "💩", "💀" , "🤖"]
    
    var body: some View {
        ScrollView(.vertical) {
            Image("profile")
                .resizable()
                .frame(width: 300.0, height: 300.0)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 1))
            
            Text("Username:")
                .font(.headline)
            
            TextField("Username", text: $user)
                .keyboardType(.alphabet)
                .background(RoundedRectangle(cornerRadius: 10).fill(.thickMaterial).frame(height: 35))
                .padding([.trailing, .leading, .bottom])
            
            Text("Profile Picture:")
                .font(.headline)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(profilePick, id: \.self) { i in
                        Button(i, action: {profile = i})
                            .font(.system(size: 60))
                            .frame(width: 70, height: 70)
                            .background(
                                Circle()
                                    .fill(.white)
                            )
                    }
                }
                .padding([.trailing, .leading, .bottom])
            }
        }
    }
}

struct Personal_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
