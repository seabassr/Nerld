//
//  NerldApp.swift
//  Nerld
//
//  Created by Sebastian Rodriguez on 8/13/22.
//

import SwiftUI
import Firebase

@main
struct NerldApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Data())
        }
    }
}
