//
//  Personal.swift
//  CodingIsCool
//
//  Created by Sebastian Rodriguez on 8/12/22.
//

import SwiftUI

struct Profile: View {
    @State private var user: String = ""
    @State private var profile: String = ""
    private let profilePick: [String] = ["👽", "👻", "👾", "🤠", "🤡", "💩", "💀" , "🤖"]
    private let colorPick: [[Double]] = [[0.0, 0.0, 0.0], [0.0, 0.6, 1.0], [1.0, 0.5, 1.0], [0.6, 0.3, 1.0], [1.0, 0.0, 0.5], [1.0, 0.5, 0.0], [0.5, 0.9, 0.3]]
    
    init(username: String, profilepic: String) {
        _user = State(initialValue: username)
        _profile = State(initialValue: profilepic)
    }
    
    var body: some View {
        ScrollView(.vertical) {
            Text(profile)
                .font(.system(size: 200))
                .frame(width: 250.0, height: 250.0)
                .background(
                    Circle()
                        .fill(.black)
                )
                .padding(.bottom)
            
            Text("Username:")
                .font(.headline)
            
            TextField("Username", text: $user)
                .keyboardType(.alphabet)
                .background(RoundedRectangle(cornerRadius: 10).fill(.thickMaterial).frame(height: 35))
                .padding([.trailing, .leading, .bottom])
            
            Text("Profile Picture:")
                .font(.headline)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(profilePick, id: \.self) { i in
                        Button(i, action: {})
                            .font(.system(size: 55))
                            .frame(width: 70, height: 70)
                            .background(
                                Circle()
                                    .fill(.black)
                            )
                    }
                }
                .padding([.trailing, .leading, .bottom])
            }
            
            Text("Profile Color:")
                .font(.headline)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(colorPick, id: \.self) { i in
                        Button(action: {
                            
                        }, label: {
                            Circle()
                                .fill(Color(red: i[0], green: i[1], blue: i[2]))
                                .frame(width: 60, height: 60)
                        })
                    }
                }
                .padding([.trailing, .leading])
            }
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

struct Personal_Previews: PreviewProvider {
    static var previews: some View {
        Profile(username: "User", profilepic: "🥰")
    }
}
