//
//  Data.swift
//  Nerld
//
//  Created by Sebastian Rodriguez on 8/13/22.
//

import Foundation

class Data: ObservableObject {
    @Published var items: DataItem = DataItem(id: "12345", user: "User", profile: "👾") {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "data")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "data") {
            if let decodedItems = try? JSONDecoder().decode(DataItem.self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = DataItem.default
    }
}

struct DataItem: Codable {
    var id: String
    var user: String
    var profile: String
    
    static let `default` = DataItem(id: "12345", user: "User", profile: "👾")
}
