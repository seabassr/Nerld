//
//  Timeline.swift
//  CodingIsCool
//
//  Created by Sebastian Rodriguez on 8/12/22.
//

import SwiftUI

struct Timeline: View {
    @ObservedObject private var postModel = Post()
    @State private var searchText: String = ""
    @State private var showCompost: Bool = false
    
    init() {
        postModel.fetchPosts()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image("profile")
                    .resizable()
                    .frame(width: 40.0, height: 40.0)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.black, lineWidth: 1))
                
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
                
                Button {
                    showCompost = true
                } label: {
                    Image(systemName: "square.and.pencil")
                        .resizable()
                        .frame(width: 30.0, height: 30.0)
                        .foregroundColor(.black)
                }
            }
            .padding(.leading)
            .padding(.trailing)
            .padding(.bottom, 5)
            .background(Color.blue.ignoresSafeArea())
            
            ScrollView(.vertical) {
                ForEach(postModel.posts, id: \.self) { post in
                    PostComponent(profile: post.profile, user: post.user, content: post.content)
                }
            }
        }
        .sheet(isPresented: $showCompost, content: {
            Compost()
        })
    }
}

struct Timeline_Previews: PreviewProvider {
    static var previews: some View {
        Timeline()
    }
}
