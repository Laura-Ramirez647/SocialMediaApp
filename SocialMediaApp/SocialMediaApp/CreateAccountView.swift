//
//  CreateAccountView.swift
//  SocialMediaApp
//
//  Created by StudentPM on 5/7/25.
//

import SwiftUI

//This struct store the users information
struct User{
    var userName: String
    var password: String
    var email: String
}

//screen for creating new account
struct CreateAccountView: View {
    
    @Binding var users: [User] //We pass the users list from the main view so we can add a new user
    
    //These are to store user information
    @State private var newUserName: String = ""
    @State private var newEmail: String = ""
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    
    @State private var showError: Bool = false //control if eerror message shows
    @State private var errorMesage: String = "" //The message to show if there is an error
    @State private var accountCreated: Bool = false //Control if we switch to the login page
    
    var body: some View {
        //Navigation var
        NavigationView{
            //Layer everything on top of the background
            ZStack{
                
                Color(red: 0.97, green: 0.97, blue: 0.97)//Set the background color to a very light gray
                    .ignoresSafeArea()
                
                //Stack all elements vertically
                VStack{
                    
                    VStack{
                        
                        Image(systemName: "globe") //App icon at the top
                            .font(.system(size: 65))//make the icon larger
                            .padding(.top, 9)//Add space at the top
                        
                        
                        Rectangle() //A thin horizontal line below the icon
                            .frame(width: 300, height: 2)//Set line size
                            .padding(.bottom, 30)//Add space below the line
                        
                    }
                    //set the color of the thing inside the VStask with a gradient
                    .foregroundStyle(
                        LinearGradient(colors: [
                            Color(red: 82/255, green: 113/255, blue: 225/255), //Royal blue
                            Color(red: 255/255, green: 189/255, blue: 89/255)//Peach
                        ],
                                    startPoint: .leading,//Start gradient from left
                                    endPoint: .trailing //End at right
                                    )
                    )
                    //Stack the form fields, alinment to the left
                    VStack(alignment: .leading, spacing: 8){
                        
                        Text("Create an Account")//Title Text
                            .font(.system(size: 38))//Make it bigger
                            .bold()//Make it bold
                            .padding(.leading,15)//Push text to the right
                            .padding(.bottom, 35)//Add space below
                        
                        Text("Username")//Username label
                            .bold()//Make it bold
                            .font(.system(size: 20))//Make it little bigger
                            .padding(.leading,15)//Push text to the right
                        
                        TextField("Enter username", text: $newUserName)//Username text field
                            .padding(8)//Add space inside the box
                            //add a border around the field, and change the color to royal blue
                            .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 82/255, green: 113/255, blue: 225/255), lineWidth: 2))
                            .padding()//Space around the box
                        
                        Text("Email")//Email label
                            .bold()//Make it bold
                            .font(.system(size: 20))//Make it little bigger
                            .padding(.leading,15)//Push text to the right
                        
                        TextField("Enter email", text: $newEmail)//Email text field
                            .padding(8)//Add space inside the box
                            //add a border around the field, and change the color to royal blue
                            .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 82/255, green: 113/255, blue: 225/255), lineWidth: 2))//ronded the corners,put royal blue in the border and style the widht of the border.
                            .padding()//Space around the box
                        
                        Text("Password")//password lable
                            .bold()//Make it bold
                            .font(.system(size: 20))//Make it little bigger
                            .padding(.leading,15)//Push text to the right
                        
                        SecureField("Enter password", text: $newPassword)//password secure field
                            .padding(8)//Add space inside the box
                            //add a border around the field, and change the color to royal blue
                            .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 82/255, green: 113/255, blue: 225/255), lineWidth: 2))
                            .padding()//Space around the box
                        
                        Text("Confirm Password")//confirm password lable
                            .bold()//Make it bold
                            .font(.system(size: 20))//Make it little bigger
                            .padding(.leading,15)//Push text to the right
                        
                        SecureField("Re-enter password", text: $confirmPassword)//Confirm password secure field
                            .padding(8)//Add space inside the box
                            //add a border around the field, and change the color to royal blue
                            .overlay(RoundedRectangle(cornerRadius: 25).strokeBorder(Color(red: 82/255, green: 113/255, blue: 225/255), lineWidth: 2))
                            .padding()//Space around the box
                        
                    }
                    //Show error message in red if needed
                    if showError{
                        Text(errorMesage)
                            .foregroundColor(.red)
                    }
                    //Navigation link that become active when account is created
                    NavigationLink(destination: ContentView(), isActive: $accountCreated){
                        
                        EmptyView()
                        
                    }
                    //sing up button
                    Button(action:{
                        singIn()//call the function to check and created account
                        
                    }){
                        Text("sign up") //Button text
                            .foregroundColor(.white)//White text color
                            .font(.system(size: 20))//Medium size text
                            .fontWeight(.bold)//Make text bold
                            .frame(width: 250, height: 75)//Size of the button
                            .background(//set backgound color with rounded corners
                                RoundedRectangle(cornerRadius: 35)
                                    .fill(Color(red: 255/255, green: 189/255, blue: 89/255))
                            )
                            .padding(.top,20)//space above the button
                    }
                }
            }
        }
    }
    //This function checks all fields and adds the user if everithing is correct
    func singIn(){
        
        //If any of the fields are empty
        if newUserName.isEmpty || newEmail.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty{
            
            errorMesage = "Please fill in all fields" //shoe this error message
            showError = true
            
        }
        //Else if the password and confirm password does not match
        else if newPassword != confirmPassword{
            errorMesage = "Password do not match" //show this error message
            showError = true
        }
        //else if the pasword is lest tha 6 characters
        else if newPassword.count < 6 {
            errorMesage = "Password must be at least 6 characters" //show this error message
            showError = true
        }
        //If everything is okay, create a new user
        else{
            let newUser: User = User(userName: newUserName, password: newPassword, email: newEmail)//store evrythin in the variables of the log in page too
            
            
            //check if user already exists
            for user in users{
                //if the user enter a usser that already exist
                if newUserName == user.userName{
                    errorMesage = " Username already exists"//show this errror message
                    showError = true
                    accountCreated = false
                }
            }
            
            users.append(newUser)//Add the new user to the list
            showError = false
            accountCreated = true //go to the log in page
            
            //clear the fields
            newUserName = ""
            newEmail = ""
            newPassword = ""
            confirmPassword = ""
            
        }
    }
}

#Preview {
    CreateAccountView(users: .constant([]))
}
