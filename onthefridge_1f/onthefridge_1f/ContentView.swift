//
//  ContentView.swift
//  onthefridge_1f
//
//  Created by Apple on 7/17/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    @State private var isAnimating = true
    
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    Color.blue
                        .ignoresSafeArea()
                    Circle()
                        .scale(1.7)
                        .foregroundColor(.white.opacity(0.15))
                        .background(LinearGradient(
                            gradient: Gradient(colors: [Color.blue, Color.green]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ))
                    Circle()
                        .scale(2)
                        .foregroundColor(Color.cyan).opacity(isAnimating ? 1.0 : 0.0)
                        .frame(width: isAnimating ? 200 : 0, height: isAnimating ? 200 : 0)
                        .animation(Animation.easeInOut(duration: 1.0).repeatForever()) // Animation repeats forever
                    
                    VStack{
                        Text("Login")
                            .font(.largeTitle)
                            .bold()
                            .padding()
                            .foregroundColor(.white)
                        
                        TextField("Username", text: $username )
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                            .border(.red, width: CGFloat(wrongUsername))
                        
                        SecureField("Password", text: $password )
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                            .border(.red, width: CGFloat(wrongPassword))
                        
                        Button("Login"){
                            authenticateUser(username: username, password: password)
                        }
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                        
                        NavigationLink(destination: MainHomeView(myList: posts)
                            , isActive: $showingLoginScreen ) {
                            EmptyView()
                                .navigationBarTitle("Title", displayMode: .inline)
                                    .navigationBarHidden(true)
                            
                        }
                        
                    }
                    
                    
                    
                }
            }.background(LinearGradient(
                gradient: Gradient(colors: [Color.blue, Color.green]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ))
            
            
            
        }
        
    }
    func authenticateUser(username: String, password: String) {
        if username.lowercased() == "123" {
            wrongUsername = 0
            if password.lowercased() == "123" {
                wrongPassword = 0
                showingLoginScreen = true
            } else{
                wrongPassword = 2
            }
        } else{
            wrongUsername = 2
        }
    }
    
    
}



    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
