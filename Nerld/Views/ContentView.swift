//
//  ContentView.swift
//  CodingIsCool
//
//  Created by Sebastian Rodriguez on 8/12/22.
//

import SwiftUI
import Firebase

struct UserItem: Codable, Identifiable, Hashable {
    var id: String?
    var user: String
    var profile: String
}

struct ContentView: View {
    @State private var userData = [UserItem]()
    @State private var username = ""
    @State private var password = ""
    @State private var showIn = false
//    @State private var showOut = false
    private let db = Firestore.firestore()
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.gray)
                    
                    TextField(" Username:", text: $username)
                        .keyboardType(.alphabet)
                }
                .frame(height: 50.0)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.gray)
                    
                    TextField(" Password:", text: $password)
                        .keyboardType(.alphabet)
                }
                .frame(height: 50.0)
                
                Button {
                    signIn()
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.blue)
                        .overlay(Text("Sign In").foregroundColor(.white))
                        .frame(width: 100, height: 50)
                }
                
                Button {
                    signUp()
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.green)
                        .overlay(Text("Sign Up").foregroundColor(.white))
                        .frame(width: 100, height: 50)
                }
            }
            .padding()
            .alert("Username or password is incorrect!", isPresented: $showIn) {
                Button("OK", role: .cancel) { }
            }
//            .alert("User already exist, try signing in!", isPresented: $showOut) {
//                Button("OK", role: .cancel) { }
//            }
        }
    }
    
    func signIn() {
        if (username != "" && password != "") {
            db.collection("users").whereField("username", isEqualTo: username).getDocuments() {(snapshot, error) in
                guard let documents = snapshot?.documents else {
                    return
                }
                
                userData = documents.map { docSnapshot -> UserItem in
                    let data = docSnapshot.data()
                    let docId = docSnapshot.documentID
                    let user = data["username"] as? String ?? ""
                    let pass = data["password"] as? String ?? ""
                    let pro = data["profile"] as? String ?? ""
                    
                    if (pass == password) {
                        return UserItem(id: docId, user: user, profile: pro)
                    }
                    else {
                        return UserItem(id: "", user: "", profile: "")
                    }
                }
                
                if (!userData.isEmpty) {
                    if (userData[0].id != "") {
                        HomeView(user: userData[0].user, profile: userData[0].profile)
                    }
                    else {
                        showIn = true
                    }
                }
            }
        }
    }
    
    func signUp() {
        print("PASS")
//        if (username != "" && password != "") {
//            db.collection("users").whereField("username", isEqualTo: username).getDocuments() {(snapshot, error) in
//                guard let documents = snapshot?.documents else {
//                    return
//                }
//
//                if (documents.isEmpty) {
//                    db.collection("users").addDocument(data: ["user": username, "profile": "😃", "password": password])
//                }
//                else {
//                    showOut = true
//                }
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
