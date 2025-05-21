//
//  TabPageView.swift
//  SocialMediaApp
//
//  Created by StudentPM on 5/16/25.
//

import SwiftUI

//This is the main view with bottom tab bar navigation
struct TabPageView: View {
    
    @State private var posts: [post] = [] //A list of post that can be shared across views
    @State private var isPresented: Bool = false //This controls if the NewPostView is shows or not
    
    var body: some View {
        
        //Create a tab bar with multiple pages
        TabView{
            
            //First tab: Home page
            HomePageView(username: "Laura_R24")
                .tabItem{
                    Image(systemName: "house")//set the tab bar icon
                    Text("House")//text under the icon
                }
            //second tab: New post page
            NewPostView(username: "Laura_R24", posts: $posts, isPresented: $isPresented)
                .tabItem{
                    Image(systemName: "camera")//camera icon
                    Text("Post")//text under the icon

                }
            //Thirt tab: Account page
            accountPageView()
                .tabItem{
                    Image(systemName: "person.circle")//person icon
                    Text("Account")//text under the icon
                }
            
        }
        .padding(.top, 10)//Add padding on the top of the tab view
        .ignoresSafeArea() //Ignore safe areas to stretch contet fully
    }
}

#Preview {
    TabPageView()
}
