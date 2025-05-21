//
//  HomePageView.swift
//  SocialMediaApp
//
//  Created by StudentPM on 5/7/25.
//

import SwiftUI

//Struct to represent each post
struct post{
    var user: String //Username of the person who made the post
    var imageName: String //Name of the image file in assets
    var caption: String //Caption ot text of the post
    var likes: Int //Number of likes on the post
    var comments: Int //Number of comments
}

struct HomePageView: View {
    
    var username: String
    //Sample posts to display on the home page
    @State private var posts: [post]=[
        post(user: "Susan_10",imageName: "Sun",caption: "beautiful sunset", likes: 3, comments: 10),
        post(user: "Maria20-",imageName: "dog",caption: "My pet", likes: 0, comments: 5),
        post(user: "Sof_2w1",imageName: "flowers",caption:"Field of flowers,beutiful view", likes: 6, comments: 1)
    ]
    
    @State private var users: [User] = [] //Placeholder for user data if needed
    
    @State private var followingStatus: [Bool] = [false, false, false] //Track follos and unfollow status
    @State private var showNewPost: Bool = false //whe user create a new post
    
    var body: some View {
        //Navigation continer
        NavigationView{
            //Allows scrolling through all posts
            ScrollView{
                
                ZStack{
                    
                    VStack{
                        
                        HStack{
                            
                            Text(username) //Display the logged in username
                                .foregroundColor(Color(red: 82/255, green: 113/255, blue: 225/255))//Royal blue color
                                .position(x: 270, y: 30) //position text to the right
                            
                            //Link to account setting page
                            NavigationLink(destination:accountSettingsView()){
                                
                                Image(systemName: "person.fill") //Profil icon
                                    .foregroundColor(Color(red: 255/255, green: 189/255, blue: 89/255))//peach color
                                    .font(.system(size: 30))//Size of the icon
                                    .position(x: 130, y: 25)//move icon to the left
                                
                            }
                        }
                        .padding(.bottom, 8) //space below top bar
                        
                        //app title section aling to the center
                        VStack(alignment: .center){
                            
                            Image(systemName: "globe")//App icon
                                .font(.system(size: 58))//Icon size
                            
                            Text("Conectate")//App name
                                .font(.system(size: 45))//font size
                                .padding(.bottom, 2)//little space below the text
                            
                            
                            Rectangle() //line unnder the title
                                .frame(width: 300, height: 2) //width and height of the line
                                .padding(.bottom, 20)//space below the line
                        }
                        .foregroundStyle( //Gradient color style for the title section
                            LinearGradient(colors: [
                                Color(red: 82/255, green: 113/255, blue: 225/255),
                                Color(red: 255/255, green: 189/255, blue: 89/255)
                            ],
                                           startPoint: .leading,
                                           endPoint: .trailing
                                          )
                        )
                        
                        //Loop throgh all posts
                        ForEach(posts.indices, id:\.self){ index in
                            
                            VStack{
                                //display user and icon
                                HStack{
                                    
                                    Image(systemName: "person.fill")//user icon
                                        .foregroundColor(.white)//white icon
                                        .padding(.top, 5)//space at top
                                    
                                    Text(posts[index].user)//show username
                                        .bold() //bold text
                                        .foregroundColor(.white) //white text
                                        .padding(.top, 5)//space at top

                                }
                                //post image
                                Image(posts[index].imageName)
                                    .resizable()//make image resizable
                                    .aspectRatio(contentMode: .fill)//fill the space
                                    .frame(width: 200, height: 150)//set size of image
                                    .clipped()//clip extra parts
                                    .border(Color(red: 255/255, green: 189/255, blue: 89/255), width: 2)//peach border
                                    .cornerRadius(30)//rounded corners
                                 
                                //caption of the post
                                Text(posts[index].caption)
                                    .padding(.bottom, 5)//space below caption
                                    .foregroundColor(.white)//white text
                                    .bold()//bold text
                                
                                //likes, comments, and follow button
                                HStack{
                                    
                                    //Heart icon to like
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.white)//white icon
                                        .onTapGesture { //add one like when tapped
                                            posts[index].likes += 1
                                        }
                                    
                                    //show number of likes
                                    Text("\(posts[index].likes)")
                                        .bold()//bolt it
                                        .font(.system(size: 15))//smaller
                                        .foregroundColor(.white)//white icon
                                    
                                    //comment icon
                                    Image(systemName: "bubble.right.fill")
                                        .foregroundColor(.white)//white icon
                                    
                                    Text("\(posts[index].comments)")//show number of comments
                                        .bold()//make bold
                                        .font(.system(size: 15))//font size
                                        .foregroundColor(.white)//white icon
                                    
                                    //follow unfollow button
                                    Button(action:{
                                        followingStatus[index].toggle()//be able to swich follow/unfollow
                                    }){
                                        Text(followingStatus[index] ? "Unfollow" : "Follow") //change the text based on satus
                                            .padding(6)//padding around the button
                                            .background(followingStatus[index] ? Color.blue : Color.white)//background collor depends of follow or unfollow
                                            .foregroundColor(followingStatus[index] ? Color.white : Color.blue)//foregound collor depends of follow or unfollow
                                            .cornerRadius(10)//round the corners
                                            .padding(.leading, 9)//space to the left
                                            .padding(.bottom, 6)//space at bottom
                                        
                                    }
                                
                                }
                                
                            }
                            
                        }
                        .frame(width: 330, height: 260)//size of each post card
                        .background(Color(red: 255/255, green: 189/255, blue: 89/255))//card color
                        .border(Color(red: 82/255, green: 113/255, blue: 225/255), width: 2)//royal blue border
                        .cornerRadius(20)//round the corners
                        
                    }
                }
            }
            //This show a sheet when shownewpost is true
            .sheet(isPresented: $showNewPost){
                NewPostView(username: username, posts: $posts, isPresented: $showNewPost)//Show the new poster with all it information
                    
            }
        }
    }
}

#Preview {
    HomePageView(username: "Laura_R24")
}
