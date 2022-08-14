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
        setupTab()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

private extension NerldApp {
    func setupTab() {
        if #available(iOS 13.0, *) {
           let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
           tabBarAppearance.configureWithDefaultBackground()
           
            if #available(iOS 15.0, *) {
              UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
           }
        }
    }
}
