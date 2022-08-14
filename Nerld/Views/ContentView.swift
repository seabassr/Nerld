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
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var profile: String = ""
    @State private var home: Bool = false
    @State private var showAlert: Bool = false
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
                    
                    SecureField(" Password:", text: $password)
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
                
                NavigationLink(destination: HomeView(user: username, profile: profile), isActive: $home) {EmptyView()}
            }
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .padding()
            .alert("Error, Please Try Again!", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            }
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
                        self.profile = userData[0].profile
                        clearLogin()
                        home = true
                    }
                    else {
                        clearLogin()
                        showAlert = true
                    }
                }
            }
        }
    }
    
    func signUp() {
        if (username != "" && password != "") {
            db.collection("users").whereField("username", isEqualTo: username).getDocuments() {(snapshot, error) in
                guard snapshot?.documents != nil else {
                    createUser()
                    return
                }
                
                clearLogin()
                showAlert = true
            }
        }
    }
    
    func createUser() {
        db.collection("users").addDocument(data: ["user": username, "profile": profile, "password": self.password])
        self.profile = "🤓"
        clearLogin()
        home = true
    }
    
    func clearLogin() {
        self.username = ""
        self.password = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
