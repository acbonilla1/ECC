//
//  ProfileView.swift
//  onthefridge_1f
//
//  Created by Apple on 7/20/23.
//

import SwiftUI

struct ProfileView: View {
    var user: User

    var body: some View {
        VStack{
            HStack{
                Text(user.user) // Display username of user
                    .font(.title)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.leading)
                
                if (user.premium == true){ // Display the premium status of user
                    Image(systemName: "checkmark.seal.fill").foregroundColor(.blue)
                }
                
                Spacer()
                VStack{
                    Text("Posts") // Display # of Posts
                    Text("\(user.userPosts.count)")
                }.font(.title2)
                VStack{
                    Text("Likes") // Display # of Likes
                    Text("\(user.likes)")
                }.font(.title2)
            }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            HStack{
                user.userImage // Load the profile picture
                    .resizable()
                    .aspectRatio(UIImage(named: user.userImageName)!.size, contentMode: .fill)
                
                    .clipShape(Circle()) // Circle Outline
                    .overlay{
                        Circle().stroke(.white, lineWidth: 0)
                    }
                    .shadow(radius: 0)
                    .frame(width: 70, height: 70)
                Text(user.description).fontWeight(.regular) // Load the custom user description
                    .multilineTextAlignment(.leading) .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                Spacer()
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
            HStack{
                Text("(Professional Youth Profile)") // Displays that the user is a Youth Creator
                    .font(.title2)
                    .fontWeight(.regular)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
            }.padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
            HStack{
                Text("Posts").font(.title2).multilineTextAlignment(.leading) // Title Text
                Spacer()
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
            VStack{
                List{
                    ForEach(user.userPosts, id: \.self) { instance in // Goes through each of the user's posts and loads them
                        HStack{
                            instance.postImage // Loading the main image of each post
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            .shadow(radius: 0)
                            .frame(maxWidth:.infinity)            .clipped()
                            
                        }
                        VStack{
                            HStack{
                                Text(user.user).bold() + Text(" " + instance.description) // Loading the description of each post
                                Spacer()
                            }.frame(maxWidth: .infinity).multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/).truncationMode(.tail).lineLimit(2)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        }
                        
                    }.listRowSeparator(.hidden)
                }.listStyle(PlainListStyle())
                
            }
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: users[0]) // Loads in the specified user to this profile view
    }
}
