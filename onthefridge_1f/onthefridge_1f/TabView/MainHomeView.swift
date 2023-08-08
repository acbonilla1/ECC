//
//  ContentView.swift
//  onthefridge_1f
//
//  Created by Apple on 7/17/23.
//

import SwiftUI

struct MainHomeView: View {
    @State private var selectedTab = 0
    @State public var myList: [Post]
    
    var body: some View {

        VStack {
            TabView(selection: $selectedTab) {
                HomeFeedListView(listOfPosts: myList).tabItem { // Loads the posts
                    Image(systemName: "house") }.tag(1)
                
                SearchView(selectedTab: $selectedTab, selectedCategoryArray: $myList).tabItem { Image(systemName: "magnifyingglass") }.tag(2) // Loads searching system
                
                CreatePostView().tabItem { Image(systemName: "photo.on.rectangle.angled") }.tag(3) // Loads the posting system
                
                MarketView().tabItem{ // Loads the market page for stickers/emojis/etc
                    Image(systemName: "dollarsign.circle")}.tag(4)
                
                ProfileView(user: users[0]).tabItem { Image(systemName: "person.crop.circle") }.tag(5) // Loads the user's profile

            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct MainHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MainHomeView(myList: posts) // Loads the currently selected posts into the feed, selection is based on filter/search input
    }
}
