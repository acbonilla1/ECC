//
//  HomeFeedListView.swift
//  onthefridge_1f
//
//  Created by Apple on 7/17/23.
//

import SwiftUI

struct HomeFeedListView: View {
    var listOfPosts: [Post]
    var body: some View {
        List{
            ForEach(listOfPosts, id: \.self) { instance in
                VStack(alignment: .center){
                    PostView(post: instance)
                        .listRowBackground(Color.clear) // Set the background to clear
                        .padding(.vertical, 15)
                }.listRowSeparator(.hidden)
            }            //.listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))

        }.listStyle(PlainListStyle())
        
    }
}

struct HomeFeedListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeFeedListView(listOfPosts: posts)
    }
}

