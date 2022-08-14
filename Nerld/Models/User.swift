//
//  User.swift
//  Nerld
//
//  Created by Sebastian Rodriguez on 8/13/22.
//

import Foundation
import Firebase

class User: ObservableObject {
    @Published var userData = UserItem(id: "12345", user: "User", profile: "😃")
    private let db = Firestore.firestore()
    
    func createUser(user: String, profile: String, content: String, language: String) {
        db.collection("users").addDocument(data: ["user": user, "profile": profile])
    }
    
    func getUser(userID: String, completion: @escaping() -> Void) {
        db.collection("users").document(userID).getDocument{(document, error) in
            guard error == nil else {
                completion()
                return
            }
            
            if let document = document, document.exists {
                let data = document.data()
                
                if let data = data {
                    let user = data["user"] as? String ?? ""
                    let profile = data["profile"] as? String ?? ""
                    self.userData = UserItem(id: userID, user: user, profile: profile)
                    completion()
                    return
                }
            }
        }
    }
}

struct UserItem: Codable, Identifiable, Hashable {
    var id: String?
    var user: String
    var profile: String
}
