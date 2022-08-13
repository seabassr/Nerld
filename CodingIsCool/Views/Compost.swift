//
//  Compost.swift
//  CodingIsCool
//
//  Created by Sebastian Rodriguez on 8/13/22.
//

import SwiftUI

struct Compost: View {
    @ObservedObject private var postModel = Post()
    @State private var content: String = ""
    @State private var showingAlert = false
    @State private var language: String = "Python"
    private var languages: [String] = ["Python", "Java", "Swift", "Kotlin", "HTML/CSS", "Javascript"]
    
    var body: some View {
        VStack {
            TextEditor(text: $content)
                .frame(width: .infinity, height: 300)
                .keyboardType(.alphabet)
                .border(.black)
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
            postModel.sendPost(user: "user", profile: "👏", content: self.content, language: self.language)
            self.content = ""
        }
        else {
            showingAlert = true
        }
    }
}

struct Compost_Previews: PreviewProvider {
    static var previews: some View {
        Compost()
    }
}
