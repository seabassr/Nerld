//
//  Timeline.swift
//  CodingIsCool
//
//  Created by Sebastian Rodriguez on 8/12/22.
//

import SwiftUI
import Firebase

struct PostItem: Codable, Identifiable, Hashable {
    var id: String?
    var user: String
    var profile: String
    var content: String
    var language: String
}

class Post: ObservableObject {
    @Published var posts = [PostItem]()
    private let db = Firestore.firestore()
    
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
                let language = data["language"] as? String ?? ""
                return PostItem(id: docId, user: user, profile: profile, content: content, language: language)
            }
        })
    }
}

struct Timeline: View {
    @State private var searchText: String = ""
    @ObservedObject private var postModel = Post()
    
    init() {
        postModel.fetchPosts()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(Color.gray)
                    
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .padding(.leading)
                        TextField("Search", text: $searchText)
                            .keyboardType(.alphabet)
                    }
                }
                .frame(height: 40.0)
            }
            .padding([.leading, .trailing, .bottom])
            .background(Color.blue.ignoresSafeArea())
            
            ScrollView(.vertical) {
                ForEach(postModel.posts, id: \.self) { post in
                    PostComponent(profile: post.profile, user: post.user, content: post.content, language: post.language)
                }
            }
        }
    }
}

struct Timeline_Previews: PreviewProvider {
    static var previews: some View {
        Timeline()
    }
}
