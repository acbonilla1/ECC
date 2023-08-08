//
//  PostView.swift
//  onthefridge_1f
//
//  Created by Apple on 7/17/23.
//

import SwiftUI
import Foundation

struct PostView: View {
    @State private var likeButton: String = "hand.thumbsup"
    @State private var liked = false
    @State private var currentLikes: Int = 0
    @State private var commentButton: String = "message"

    @State private var loadCommentView = false
    @State private var isShowingProfile = false

    var post: Post

    var body: some View {

        VStack{
            HStack{
                post.userImage // This is where the profile picture is loaded
                .resizable()
                .aspectRatio(UIImage(named: post.userImageName)!.size, contentMode: .fill)

                    .clipShape(Circle()) // Circle border for profile picture
                    .overlay{
                    Circle().stroke(.white, lineWidth: 0)
                }
                .shadow(radius: 0)
                .frame(width: 45, height: 45)
                 
                Button(post.user){ // This button allows us to visit their profile
                    isShowingProfile = true // Enable us to view the profile after clicking the button
                }
                .sheet(isPresented: $isShowingProfile){
                    ProfileView(user: post.userID) // Loads the specific profile view when the above button is pressed
                }
                Spacer()
                Text(post.date).multilineTextAlignment(.trailing)  // Displays Date Posted
            }.frame(maxWidth:.infinity)
            
            post.postImage // Loads the post's main image
                .resizable()
                .aspectRatio(contentMode: .fit)
            .shadow(radius: 0)
            .frame(maxWidth:.infinity).clipped() // Normalize post size to screen & crop it

            
            HStack{
                Button{ // Like Button
                    if liked == false{
                        likeButton = "hand.thumbsup.fill" // Change thumb logo to Liked
                        liked = true
                        currentLikes = currentLikes + 1 // Increase # of likes
                    }
                    else {
                        likeButton = "hand.thumbsup" // Change thumb logo to Unliked
                        liked = false
                        currentLikes = currentLikes - 1 // Decrease # of likes
                    }
                } label: {
                    Image(systemName: likeButton) // Loads initial Like Button image
                }
                Spacer()
                Button{
                    loadCommentView.toggle() // Comment Button
                } label: {
                    Image(systemName: commentButton)
                } .sheet(isPresented: $loadCommentView, content: {
                    CommentListView(post: post) // Opens the list of comments through a new view
                })
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
            }.buttonStyle(.bordered)
            VStack{
                HStack{
                    Text("\(currentLikes) likes").bold() // Displaying # of Likes
                    Spacer()
                }.frame(maxWidth: .infinity).multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/).truncationMode(.tail).lineLimit(2)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                HStack{
                    Text(post.user).bold() + Text(" " + post.description) // Displaying post description
                    Spacer()
                }.frame(maxWidth: .infinity).multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/).truncationMode(.tail).lineLimit(2)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }

        }.listStyle(DefaultListStyle())
        .onAppear(){
            if (currentLikes < post.likes){
                currentLikes = post.likes
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: posts[0]) // Pass in the specific data for this ONE post
    }
}
