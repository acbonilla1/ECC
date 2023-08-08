//
//  MarketView.swift
//  onthefridge_1f
//
//  Created by Apple on 7/24/23.
//

import SwiftUI

struct MarketView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Marketplace")
                    .font(.largeTitle)
                    .multilineTextAlignment(.leading)
                Spacer()
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
            HStack{
            Text("Stickers, Reactions, & More!")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.leading).italic(true)
                Spacer()
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
            
            Divider().padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))

            
            HStack{
                
                VStack{
                    Circle()
                        .fill(LinearGradient(
                            gradient: Gradient(colors: [Color.blue, Color.green]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ))
                        .frame(width: 100, height: 100)
                        .overlay(
                            Image(systemName: "heart.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                        )
                    Text("$2.99").font(.callout).fontWeight(.regular).italic(true).foregroundColor(.gray)
                }

                VStack{
                    Circle()
                        .fill(LinearGradient(
                            gradient: Gradient(colors: [Color.blue, Color.green]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ))
                        .frame(width: 100, height: 100)
                        .overlay(
                            Image(systemName: "face.smiling.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                        )
                    Text("$2.99").font(.callout).fontWeight(.regular).italic(true).foregroundColor(.gray)
                }
                
               
                VStack{
                    Circle()
                        .fill(LinearGradient(
                            gradient: Gradient(colors: [Color.blue, Color.green]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ))
                        .frame(width: 100, height: 100)
                        .overlay(
                            Image(systemName: "hands.sparkles.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                        )
                    Text("$2.99").font(.callout).fontWeight(.regular).italic(true).foregroundColor(.gray)
                }
                
                
            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            
            
            HStack{
                Text("Featured Creations")
                    .font(.title2)
                    .fontWeight(.regular)
            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            
            HStack{
                VStack{
                    Circle()
                        .fill(LinearGradient(
                            gradient: Gradient(colors: [Color.blue, Color.green]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ))
                        .frame(width: 100, height: 100)
                        .overlay(
                            Image(systemName: "figure.skating")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                        )
                    Text("$2.99").font(.callout).fontWeight(.regular).italic(true).foregroundColor(.gray)
                }
            }
            Spacer()
        }
    }
}

struct MarketView_Previews: PreviewProvider {
    static var previews: some View {
        MarketView()
    }
}
