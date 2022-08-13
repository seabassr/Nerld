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
    
    var body: some View {
        List {
            TextEditor(text: $content)
                .frame(width: .infinity, height: 300)
                .keyboardType(.alphabet)
            
            HStack {
                Spacer()
                
                Button {
                    sendContent()
                } label: {
                    RoundedRectangle(cornerRadius: 20)
                        .overlay(Text("Post").foregroundColor(.white))
                        .frame(width: 100, height: 50)
                }
                
                Spacer()
            }
        }
    }
    
    func sendContent() {
        postModel.sendPost(user: "user", profile: "👏", content: self.content)
        self.content = ""
    }
}

struct Compost_Previews: PreviewProvider {
    static var previews: some View {
        Compost()
    }
}
