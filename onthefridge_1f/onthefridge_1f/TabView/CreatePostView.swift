//
//  CreatePostView.swift
//  onthefridge_1f
//
//  Created by Apple on 7/26/23.
//

import SwiftUI

struct CreatePostView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Create a Post!").font(.title)
            }.padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
            HStack{
                Image(systemName: "photo.on.rectangle.angled").foregroundColor(.purple)
            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            HStack{
                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)).frame(width:.infinity, height:250).foregroundColor(.cyan)
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            
            HStack{
                TextField("Type Description Here...", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            }
            
            Spacer()
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)

        }
        
        
    }
}

struct CreatePostView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostView()
    }
}
