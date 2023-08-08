//
//  CommentListView.swift
//  onthefridge_1f
//
//  Created by Apple on 7/20/23.
//

import SwiftUI

struct CommentListView: View {
    var post: Post

    var body: some View {
        
        VStack{
            HStack{
                Text("Comments") // Title Text
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading).padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 0))
                Spacer()
            }
            
            HStack{
                List{ // Load each comment and display its specific information
                    ForEach(post.comments.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                        HStack {
                            
                            if let exuser = users.first(where: { $0.user == key }) {
                                exuser.userImage // Load the commenter's profile picture
                                .resizable()
                                    .clipShape(Circle())
                                    .overlay{
                                    Circle().stroke(.white, lineWidth: 0)
                                }
                                .shadow(radius: 0)
                                .frame(width: 45, height: 45)
                            }

                            Text(key).bold(true) // Load the username of the commentor
                            Text(value).multilineTextAlignment(.leading) // Load the actual comment content
                            Spacer()
                        }
                    }
                    ForEach(post.stickerComments.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                        HStack { // Load the sticker comments, *same logic as above*
                        
                            if let exuser = users.first(where: { $0.user == key }) {
                                exuser.userImage // Load the commenter's profile picture
                                .resizable()
                                    .clipShape(Circle())
                                    .overlay{
                                    Circle().stroke(.white, lineWidth: 0)
                                }
                                .shadow(radius: 0)
                                .frame(width: 45, height: 45)
                            }

                           
                            Text(key).bold(true) // Load the username of the commentor
                            Image(systemName: (value)).foregroundColor(.green) // Load the actual comment content
                            Spacer()
                        }
                    }
                }.listStyle(PlainListStyle())
            }
        }
    }
}

struct CommentListView_Previews: PreviewProvider {
    static var previews: some View {
        CommentListView(post: posts[0]) // Pass in the specific data for this ONE post's comments
    }
}
