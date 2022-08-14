//
//  TabView.swift
//  Nerld
//
//  Created by Sebastian Rodriguez on 8/13/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            Timeline()
                .tabItem() {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            Compost()
                .tabItem() {
                    Image(systemName: "plus.circle.fill")
                    Text("Post")
                }
            Profile(userID: "FKY8TsAjObSQIXl5uki1")
                .tabItem() {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
