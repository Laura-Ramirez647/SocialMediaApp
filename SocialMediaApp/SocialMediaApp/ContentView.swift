//
//  ContentView.swift
//  SocialMediaApp
//
//  Created by StudentPM on 5/2/25.
//

import SwiftUI

//main view when users log in
struct ContentView: View {
    
    @State private var users: [User] = [
    User(userName: "Laura_R24", password: "123456", email: "Laura@gmail.com")
    ] //A list that store all users who created an account
    @State private var loggedIn: [User] = [] //A list to keep track of who is log in

    //These hold the values typed in the create account screen
    @State private var email: String = ""
    @State private var userName: String = ""
    @State private var password: String = ""
    
    //Rhese hold the username/email and password  typed by the user on the login page
    @State private var typedUserName: String = ""
    @State private var typedPassword: String = ""
    
    @State private var showError: Bool = false //This show a error message if login is not succcessful
    @State private var changePage: Bool = false //This change the page if login is successful
    @State private var errorMesage: String = "" //This is a message to show when somenthing is wrong
    
    var body: some View {
        //Add a navigation var
        NavigationView{
            //Stack everything on the top of each other
            ZStack{
                
                Color(red: 0.97, green: 0.97, blue: 0.97) //set the background color of the page
                    .ignoresSafeArea()
                
                //Stack everything vertically
                VStack {
                    //This top part shows the app icon and title
                    VStack{
                        
                        Image(systemName: "globe") //Globe icon at the top
                            .font(.system(size: 60)) //style it size
                        
                        Text("Conectate")//The app name
                            .font(.system(size: 50))//style it size
                            .padding(.bottom, 5)//add space on the bottom
                        
                        //A small line below the text
                        Rectangle()
                            .frame(width: 300, height: 2)//style the with and height
                            .padding(.bottom, 40)//add space on the bottom
                        
                    }
                    //change the foreground color of all inside of the previous VStasck.
                    .foregroundStyle(
                        //A gradient color for the line
                        LinearGradient(colors: [
                            Color(red: 82/255, green: 113/255, blue: 225/255),
                            Color(red: 255/255, green: 189/255, blue: 89/255)
                        ],
                                startPoint: .leading, //start from leaf to right
                                endPoint: .trailing
                                )
                    )
                    // This stack holds the login form. alingn everuthing inside this to the left.
                    VStack(alignment: .leading, spacing: 10){
                        
                        Text("Log in") //Title for login
                            .bold() //bold it
                            .font(.system(size: 30)) //make bigger
                            .padding(.bottom,30) // add space on the bottom.
                        
                        Text("Username/Email")//The user know what information have to put in the text field
                            .bold()
                            .font(.system(size: 20))

                        TextField("Username/Email", text: $typedUserName) //Text field for username/email. and store it in typedUserName
                            .padding(8)//add padding around the text
                            .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 82/255, green: 113/255, blue: 225/255), lineWidth: 2))//make the corners circulars
                            .padding()//padding around the text field
                        
                        Text("Password")//The user know what information have to put in the text field
                            .bold()//bold it
                            .font(.system(size: 20))//change the size
                        
                        SecureField("Password", text: $typedPassword)
                            .padding(8)//add padding around the text
                            .overlay(RoundedRectangle(cornerRadius: 25.0).strokeBorder(Color(red: 82/255, green: 113/255, blue: 225/255), lineWidth: 2))//make the corners circulars
                            .padding()//padding around the text field
                    
                    }
                    //if there is an errror show the error message in red
                    if showError{
                        Text(errorMesage)
                            .foregroundColor(.red)
                    }
                    //This is a navigation to the home page if login works
                    NavigationLink(destination: TabPageView(), isActive: $changePage){
                        
                        EmptyView()
                        
                    }
                    //The login button
                    Button(action:{
                        //Call the login function when pressed
                        login()
                        
                    }){
                        //Text on the button
                        Text("Log in")
                            .bold()//bold it
                            .foregroundColor(.white)//Make the foreground white
                            .font(.system(size: 20))//Change the size of the text
                            .frame(width: 250, height: 75)//change the size of the button
                            .background(
                                RoundedRectangle(cornerRadius: 35)//rounded the corners
                                    .fill(Color(red: 255/255, green: 189/255, blue: 89/255))//change the color
                            )
                            .padding(.top,40)//Add padding on thr top of the button
                    }
                    
                    //Forgot password link( Not working now, just text)
                    Text("Forgot password?")
                        .padding(.top, 10)//add padding in the top
                        .foregroundColor(Color(red: 82/255, green: 113/255, blue: 225/255))//Change the foreground color
                        .padding(.bottom, 40)//add padding in the botton
                    
                    //If user does not have an account
                    Text("Don’t have an account?")
                        .bold()//bold text
    
                    //This takes user to the sing in page
                    NavigationLink(destination: CreateAccountView(users: $users)){
                        Text("Sign up")
                            .foregroundColor(Color(red: 82/255, green: 113/255, blue: 225/255))//change the text color
                    }
                }
                .padding() //Add padding on the botton of this VStask
            }
        }
    }
    //This function handle the log in logic
    func login(){
        
        //If either field id empty, show an error
        if typedUserName.isEmpty || typedPassword.isEmpty{
            
            showError = true //If it empty
            errorMesage = "Please fill in all fields" //show this error message
        }
        
        else{
            //Otherwise check the list of users
            showError = false
            
            //Go inside of each user inside users
            for user in users {
                //If user or email match and password is correct
                if (typedUserName == user.userName || typedUserName == user.email) && typedPassword == user.password{
                    
                    changePage = true //go to the home page
                    return
                }
            }
            //If not match was found show an error
            errorMesage = "Invalid username/email or password" //text of the error message
            showError = true
            
        }
        //clear the user and password field
        typedPassword = ""
        typedUserName = ""
        
        
    }
}

#Preview {
    ContentView()
}
