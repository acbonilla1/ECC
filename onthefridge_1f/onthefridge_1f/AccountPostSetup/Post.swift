//
//  Post.swift
//  onthefridge_1f
//
//  Created by Apple on 7/17/23.
//

import Foundation
import SwiftUI

struct Post: Hashable, Codable, Identifiable {
    var id: Int
    var user: String
    var category: String
    var likes: Int
    var comments: [String: String]
    var stickerComments: [String: String]

    var userImageName: String
    var userImage: Image {
        Image(userImageName)
    }
    
    var date: String
    var description: String

    private var postImageName: String
    var postImage: Image {
        Image(postImageName)
    }
    
    var userID: User{
        return (users.filter { $0.user == user })[0]
    }
    
    
}
