//
//  TabView.swift
//  Nerld
//
//  Created by Sebastian Rodriguez on 8/13/22.
//

import SwiftUI

struct HomeView: View {
    private var user: String = ""
    private var profile: String = ""
    
    init(user: String, profile: String) {
        self.user = user
        self.profile = profile
    }
    
    var body: some View {
        TabView {
            Timeline()
                .tabItem() {
                    VStack {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                }
                .tag(0)
            Compost(user: self.user, profile: self.profile)
                .tabItem() {
                    VStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Post")
                    }
                }
                .tag(1)
            Profile(username: user, profilepic: profile)
                .tabItem() {
                    VStack {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
                }
                .tag(2)
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(user: "UserTest", profile: "🥰")
    }
}
