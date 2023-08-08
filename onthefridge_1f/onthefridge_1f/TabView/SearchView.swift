//
//  SearchView.swift
//  onthefridge_1f
//
//  Created by Apple on 7/25/23.
//

import SwiftUI

struct SearchView: View {
    @Binding var selectedTab: Int
    @Binding var selectedCategoryArray: [Post]

    @State private var searchText = ""
    @State private var selectedUser: User? = nil

    var body: some View {
        VStack{
            
            HStack { // Load the search bar
                Image(systemName: "magnifyingglass")
                TextField("Search", text: $searchText, onCommit:{
                    
                    let result = (users.filter { $0.user.lowercased() == searchText.lowercased() })[0]
                        selectedUser = result
                })
            }.padding(.horizontal)

            .sheet(item: $selectedUser) { user in // Load the profile for the searched user
                ProfileView(user: user)
            }
            
            
            HStack{
                Text("Choose a Genre") // Title Text
                    .font(.largeTitle)
                    .multilineTextAlignment(.leading)
                Spacer()
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 40, trailing: 0))
            
            HStack{
                Button(action: { // Load the feed for All posts
                    selectedTab = 0
                    selectedCategoryArray = posts
                 }) {
                     Text("All")
                         .foregroundColor(.white)
                         .frame(width: 60)
                         .minimumScaleFactor(0.5)
                         .padding()
                         .font(.title2)
                     
                 }
                 .background(
                     Capsule()
                         .fill(LinearGradient(
                            gradient: Gradient(colors: [Color.blue, Color.green]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ))
                 )
                
                Button(action: { // Load the feed for Art posts
                    selectedTab = 0
                    selectedCategoryArray = posts.filter { $0.category == "Art"}
                 }) {
                     Text("Art")
                         .foregroundColor(.white)
                         .frame(width: 60)
                         .minimumScaleFactor(0.5)
                         .padding()
                         .font(.title2)
                     
                 }
                 .background(
                     Capsule()
                         .fill(LinearGradient(
                            gradient: Gradient(colors: [Color.blue, Color.green]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ))
                 )
                
                Button(action: { // Load the feed for Tech posts
                    selectedTab = 0
                    selectedCategoryArray = posts.filter { $0.category == "Tech"} // Filter all posts
                 }) {
                     Text("Tech")
                         .foregroundColor(.white)
                         .frame(width: 60)
                         .minimumScaleFactor(0.5)
                         .padding()
                         .font(.title2)
                     
                 }
                 .background(
                     Capsule()
                         .fill(LinearGradient(
                            gradient: Gradient(colors: [Color.blue, Color.green]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ))
                 )
            }

            HStack{
                Button(action: { // Load the feed for Food posts
                    selectedTab = 0
                    selectedCategoryArray = posts.filter { $0.category == "Food"}
                 }) {
                     Text("Food")
                         .foregroundColor(.white)
                         .frame(width: 80)
                         .minimumScaleFactor(0.5)
                         .padding()
                         .font(.title2)
                     
                 }
                 .background(
                     Capsule()
                         .fill(LinearGradient(
                            gradient: Gradient(colors: [Color.blue, Color.green]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ))
                 )
                
                
                Button(action: { // Load the feed for Music posts
                    selectedTab = 0
                    selectedCategoryArray = posts.filter { $0.category == "Music"}
                 }) {
                     Text("Music")
                         .foregroundColor(.white)
                         .frame(width: 80)
                         .minimumScaleFactor(0.5)
                         .padding()
                         .font(.title2)
                     
                 }
                 .background(
                     Capsule()
                         .fill(LinearGradient(
                            gradient: Gradient(colors: [Color.blue, Color.green]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ))
                 )
                
                Button(action: { // Load the feed for Service posts
                    selectedTab = 0
                    selectedCategoryArray = posts.filter { $0.category == "Service"}
                 }) {
                     Text("Service")
                         .foregroundColor(.white)
                         .frame(width: 80)
                         .minimumScaleFactor(0.5)
                         .padding()
                         .font(.title2)
                     
                 }
                 .background(
                     Capsule()
                         .fill(LinearGradient(
                            gradient: Gradient(colors: [Color.blue, Color.green]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ))
                 )
            }
            
            Spacer()
            
        }
    }
        var filteredUsers: [User] { // Filter through the users to find the searched user
            if searchText.isEmpty { // If searchbar is empty..
                let empty: [User] = []
                return empty
            } else { // return the user that fits the name given
                return users.filter { $0.user.localizedCaseInsensitiveContains(searchText) }
            }
        }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(selectedTab: Binding.constant(1), selectedCategoryArray: Binding.constant(posts)) // Pass in the selected user/genre
    }
}
