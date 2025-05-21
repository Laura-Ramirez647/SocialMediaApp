//
//  accountPageView.swift
//  SocialMediaApp
//
//  Created by StudentPM on 5/12/25.
//

import SwiftUI



struct accountPageView: View {
    
    @State private var numFoll: Int = 90
    @State private var followers: Bool = false
    
    var username: String = "Laura_R24"
    
    var body: some View {
        NavigationView{
            VStack{
                
                NavigationLink(destination: accountSettingsView()){
                    Image(systemName: "person.fill")
                        .font(.system(size: 35))
                        .foregroundColor(Color(red: 255/255, green: 189/255, blue: 89/255))
                        .position(x: 348, y: 10)
                        
                }
                
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color(red: 82/255, green: 113/255, blue: 225/255))
                        .frame(width: 250, height: 250)
                    
                    Image(systemName: "person.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 180))
                        
                }
                Text(username)
                    .bold()
                    .font(.system(size: 35))
                    .padding(.bottom, 20)
                
                Text("Laura Ramirez")
                
                Text("The last part of the project was very difficult for me")
                    .foregroundColor(.gray)
                    .font(.system(size: 15))
                
                Rectangle()
                    .frame(width: 400, height: 2)
                    .foregroundColor(Color(red: 82/255, green: 113/255, blue: 225/255))
                    .padding(.bottom,30)
                
                HStack(spacing: 10){
                    Button(action:{
                        if !followers{
                            numFoll += 1
                            followers = true
                        }
                        else{
                            numFoll -= 1
                            followers = false
                        }
                    }){
                        Text(followers ? "unfollow" : "Follow")
                            .padding()
                            .background(Color(red: 255/255, green: 189/255, blue: 89/255))
                            .foregroundColor(.white)
                            .cornerRadius(18)
                    }
                    Text("\(numFoll) followers")
                        .foregroundColor(.gray)
                }
                
                LazyVGrid(columns: [GridItem(), GridItem()], spacing: 15){
                    ForEach(0..<4){index in
                        VStack{
                            Rectangle()
                                .fill(Color.blue.opacity(0.2))
                                .frame(height: 100)
                                .overlay(Image(systemName: "photo").font(.largeTitle))
                            
                            HStack{
                                Image(systemName: "heart.fill")
                                Text("20")
                                Image(systemName: "bubble.left.fill")
                                Text("5")
                            }
                            .font(.caption)
                            .foregroundColor(.gray)
                        }
                        .padding(5)
                        .cornerRadius(20)
                        
                    }
                }
                .padding()
            }
        }
    }
   
}

#Preview {
    accountPageView()
}
