//
//  NewPostView.swift
//  SocialMediaApp
//
//  Created by StudentPM on 5/16/25.
//

import SwiftUI

struct NewPostView: View {
    
    var username: String //The name of the user posting
    
    @Binding var posts: [post] //List of post
    @Binding var isPresented: Bool //Controls if the caption that the user types
    
    @State private var newCaption: String = "" //Store the caption that the user types
    @State private var errorMessage: String = ""//Store the error message if caption is empty
    
    var body: some View {
        NavigationView{
            ZStack{
                Color(red: 0.97, green: 0.97, blue: 0.97) //set background color in all the screeen
                    .ignoresSafeArea()
                
                //stack all items verlically
                VStack(spacing:20){
                    
                    //Account icon at the top right cornet that go to the account setting page
                    NavigationLink(destination: accountSettingsView()){
                        Image(systemName: "person.fill")//this is the image
                            .font(.system(size: 28))//style the size
                            .foregroundColor(Color(red: 255/255, green: 189/255, blue: 89/255))//color peach
                            .position(x: 340, y: 25)//change the position of the icon link
                        
                        //print the name of the user posting
                        Text(username)
                            .position(x: 80, y: 30)//change the position of the icon link
                    }
                    
                    Image(systemName: "globe") //App icon at the top
                        .font(.system(size: 95))//make the icon larger
                        .foregroundStyle(
                            LinearGradient(colors: [
                                Color(red: 82/255, green: 113/255, blue: 225/255), //Royal blue
                                Color(red: 255/255, green: 189/255, blue: 89/255)//Peach
                            ],
                                        startPoint: .leading,//Start gradient from left
                                        endPoint: .trailing //End at right
                                        )
                        )
                    
                    //store the things horisontally
                    HStack{
                        
                        Text("New post")
                            .font(.system(size: 35))//make text bigger
                            .bold()//make it bold
                        
                        Image(systemName: "pencil")//decoracio
                            .font(.system(size: 30))//Style the size
                        
                        
                    }
                    
                    Rectangle()//Orange line under title
                        .frame(width: 350, height: 2)//style the size
                        .foregroundColor(Color(red: 255/255, green: 189/255, blue: 89/255))//peach color
                        .padding(.bottom, 30)//add space at the bootom
                    
                    VStack (alignment: .leading){
                        Text("Add a new post")//caption prompt
                        
                        TextField("Caption", text:  $newCaption)//text field to type the caption
                            .padding(10)
                            .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 82/255, green: 113/255, blue: 225/255), lineWidth: 2))
                            .padding()
                    }
                    .padding(.horizontal)
                    
                    //show the error message if it is empty
                    if !errorMessage.isEmpty{
                        Text(errorMessage)
                            .foregroundColor(.red)
                    }
                    HStack{
                        //button to pubhis the post
                        Button(action:{
                            publishPost()//call the function
                        }){
                            Text("Publish") //text on the button
                        }
                        .padding()
                        .background(Color(red: 82/255, green: 113/255, blue: 225/255))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        
                        //cancel button that goes back to homepage
                        NavigationLink(destination:HomePageView(username: "")){
                            Text("cancel")
                                .padding()
                                .background(Color(red: 82/255, green: 113/255, blue: 225/255))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.bottom,200)
                }
            }
        }
    }
    //function to publish post
    func publishPost(){
        
        //if the caption is empty show the error mesage.
        if newCaption.isEmpty{
            errorMessage = "Post cannot be empty"
        }
        else{
            //create a new post using the caption
            let newPost = post(user: username, imageName: "dog", caption: newCaption, likes: 0, comments: 0)
            
            posts.append(newPost)//add the new post to the list
            
            //clear the inputs
            newCaption = ""
            errorMessage = ""
            isPresented = false
        }
    }
}

//testing the layout
#Preview {
    NewPostView(
        username: "Laura_R24",
        posts: .constant([]),
        isPresented: .constant(true)
    )
}
