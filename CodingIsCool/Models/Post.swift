//
//  Posts.swift
//  CodingIsCool
//
//  Created by Sebastian Rodriguez on 8/12/22.
//

import Foundation
import Firebase

class Post: ObservableObject {
    @Published var posts = [PostItem]()
    private let db = Firestore.firestore()
    
    func sendPost(user: String, profile: String, content: String) {
            db.collection("posts").addDocument(data: ["postDate": Date(), "user": user, "profile": profile, "content": content])
    }
    
    func fetchPosts() {
        db.collection("posts").order(by: "postDate", descending: true).addSnapshotListener( {(snapshot, error) in
            guard let documents = snapshot?.documents else {
                return
            }
            
            self.posts = documents.map { docSnapshot -> PostItem in
                let data = docSnapshot.data()
                let docId = docSnapshot.documentID
                let user = data["user"] as? String ?? ""
                let profile = data["profile"] as? String ?? ""
                let content = data["content"] as? String ?? ""
                return PostItem(id: docId, user: user, profile: profile, content: content)
            }
        })
    }
}

struct PostItem: Codable, Identifiable, Hashable {
    var id: String?
    var user: String
    var profile: String
    var content: String
}
