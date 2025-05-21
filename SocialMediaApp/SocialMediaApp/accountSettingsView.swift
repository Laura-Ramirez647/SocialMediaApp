//
//  accountSettingsView.swift
//  SocialMediaApp
//
//  Created by StudentPM on 5/13/25.
//

import SwiftUI

struct accountSettingsView: View {
    @State private var name: String = "Laura Ramirez"
    @State private var username: String = "Laura_R24"
    @State private var bio: String = "The last part of the project was very difficult for me"
    //@Binding var showSettings: Bool
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    //Text("laura")
                    Image(systemName: "globe")
                        .font(.system(size: 60))
                        .foregroundStyle(
                            LinearGradient(colors: [
                                Color(red: 82/255, green: 113/255, blue: 225/255), //Royal blue
                                Color(red: 255/255, green: 189/255, blue: 89/255)//Peach
                            ],
                                           startPoint: .leading,//Start gradient from left
                                           endPoint: .trailing //End at right
                                          )
                        )
                    
                    Text("Edit Profile")
                        .font(.system(size: 45))
                        .padding(.bottom, 10)
                        .bold()
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(Color(red: 82/255, green: 113/255, blue: 225/255))
                            .frame(width: 250, height: 250)
                        
                        Image(systemName: "person.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 180))
                        
                    }
                    .padding(.bottom, 5)
                    
                    VStack(alignment: .leading){
                        
                        Text("Username")
                            .bold()
                        
                        TextField("Enter your new username", text: $username)
                            .padding(8)//Add space inside the box
                        //add a border around the field, and change the color to royal blue
                            .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 82/255, green: 113/255, blue: 225/255), lineWidth: 2))
                            .padding()//Space around the box
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading){
                        
                        Text("Name")
                            .bold()
                        
                        TextField("Change your name", text: $name)
                            .padding(8)//Add space inside the box
                        //add a border around the field, and change the color to royal blue
                            .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 82/255, green: 113/255, blue: 225/255), lineWidth: 2))
                            .padding()//Space around the box
                        
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading){
                        
                        Text("Bio")
                            .bold()
                        
                        TextField("Enter your new bio", text: $bio)
                            .padding(8)//Add space inside the box
                        //add a border around the field, and change the color to royal blue
                            .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 82/255, green: 113/255, blue: 225/255), lineWidth: 2))
                            .padding()//Space around the box
                    }
                    .padding(.horizontal)
                    
                    HStack{
                        NavigationLink(destination: accountPageView()){
                            Text("Change")
                                .padding()
                                .background(Color(red: 82/255, green: 113/255, blue: 225/255))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                        NavigationLink(destination: ContentView()){
                            Text("log out")
                                .padding()
                                .background(Color(red: 82/255, green: 113/255, blue: 225/255))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
            }
        }
    }
}



#Preview {
    accountSettingsView()
}
