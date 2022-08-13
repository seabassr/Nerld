//
//  ContentView.swift
//  CodingIsCool
//
//  Created by Sebastian Rodriguez on 8/12/22.
//

import SwiftUI

struct ContentView: View {
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
            Profile()
                .tabItem() {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
