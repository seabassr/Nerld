//
//  ContentView.swift
//  CodingIsCool
//
//  Created by Sebastian Rodriguez on 8/12/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var data: Data = Data()
    @ObservedObject private var userModel: User = User()
    @State private var username = ""
    @State private var password = ""
    
    init() {
        checkLog()
    }
    
    var body: some View {
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
    }
    
    func checkLog() {
        if (data.items.id != "12345") {
            HomeView()
        }
    }
    
    func signIn() {
        if (username != "" && password != "") {
            userModel.getUser(userID: "FKY8TsAjObSQIXl5uki1", completion: {HomeView()})
        }
    }
    
    func signUp() {
        if (username != "" && password != "") {
            userModel.getUser(userID: "FKY8TsAjObSQIXl5uki1", completion: {HomeView()})
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
