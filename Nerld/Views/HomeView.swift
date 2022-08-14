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
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            Compost(user: user, profile: profile)
                .tabItem() {
                    Image(systemName: "plus.circle.fill")
                    Text("Post")
                }
            Profile()
                .tabItem() {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(user: "UserTest", profile: "🥰")
    }
}
