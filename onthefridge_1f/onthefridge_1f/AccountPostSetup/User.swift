//
//  User.swift
//  onthefridge_1f
//
//  Created by Apple on 7/20/23.
//

import Foundation
import SwiftUI

struct User: Hashable, Codable, Identifiable {
    var id: Int
    var user: String
    var category: String
    var likes: Int
    var premium: Bool
    
    var userImageName: String
    var userImage: Image {
        Image(userImageName)
    }
    
    var date: String
    var description: String
    
    var userPosts: [Post] {
        return (posts.filter { $0.user == user })
    }


    
}
