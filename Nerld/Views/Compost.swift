//
//  Compost.swift
//  CodingIsCool
//
//  Created by Sebastian Rodriguez on 8/13/22.
//

import SwiftUI
import Firebase

struct Compost: View {
    @State private var content: String = ""
    @State private var language: String = "Python"
    @State private var showingAlert = false
    private var user = ""
    private var profile = ""
    private var languages: [String] = ["Python", "Java", "Swift", "Kotlin", "HTML/CSS", "Javascript"]
    private let db = Firestore.firestore()
    
    init(user: String, profile: String) {
        self.user = user
        self.profile = profile
    }
    
    var body: some View {
        VStack {
            TextEditor(text: $content)
                .keyboardType(.alphabet)
                .padding()
            
            Text("Language:")
                .bold()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(languages, id: \.self) { i in
                        Button(i, action: {language = i})
                            .frame(width: 90, height: 40)
                            .background(RoundedRectangle(cornerRadius: 10).fill((language == i) ? .green : .blue))
                            .foregroundColor(.white)
                    }
                }
            }
            .padding(.bottom)
            
            Button {
                sendContent()
            } label: {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.purple)
                    .overlay(Text("Post").foregroundColor(.white))
                    .frame(width: 100, height: 50)
            }
            
            Spacer()
        }
        .alert("Content can't be empty!", isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        }
    }
    
    func sendContent() {
        if (content != "") {
            db.collection("posts").addDocument(data: ["postDate": Date(), "user": user, "profile": profile, "content": content, "language": language])
            self.content = ""
        }
        else {
            showingAlert = true
        }
    }
}

struct Compost_Previews: PreviewProvider {
    static var previews: some View {
        Compost(user: "UserTest", profile: "🥰")
    }
}
