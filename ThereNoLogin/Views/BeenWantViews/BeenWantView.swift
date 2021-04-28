//
//  BeenWantView.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/4/21.
//

import SwiftUI

struct BeenWantView: View {
    
    @State private var showNewPlace = false
    @EnvironmentObject var allPlaces: TherePlaceViewModel
    
    
    init() {
            UITabBar.appearance().barTintColor = UIColor.white
        }
    
    var body: some View {

        Group {
            if showNewPlace {
                NewPlaceSequence()
                
            } // End if
            
            else {
            
                ZStack {
                    
                    VStack(alignment: .leading) {
                        
                        TopMenuBar()
                        
                        TabView {
                            
                            VStack (alignment: .leading){
                                Text("Your favorites")
                                    .fontWeight(.bold)
                                    .font(.largeTitle)
                                    .padding(.leading)
                                
                                SortMenusView()
                                
                                // Instance of the Gridview based on 'want' cards only
                                CardsGridView(whichTab: 1) // will also pass in filtering for type and sorttype
                            
                            } // End VStack
                                .tabItem {
                                    Image(systemName: "bookmark")
                                    Text("Want to go")
                                }
                                    .padding(.top, 20)
                        
                            VStack (alignment: .leading) {
                                Text("Your want to go list")
                                    .fontWeight(.bold)
                                    .font(.largeTitle)
                                    .padding(.leading)

                                SortMenusView()

                                // Instance of the Gridview based on 'been' cards only
                                CardsGridView(whichTab: 2)

                            } // End VStack
                                .tabItem {
                                        Image(systemName: "heart")
                                        Text("Favorites")
                                }

                                    .padding(.top, 20)

                            VStack (alignment: .leading) {
                                Text("Your collections")
                                    .fontWeight(.bold)
                                    .font(.largeTitle)
                                    .padding(.leading)

                                SortMenusView()

                                // Instance of the Gridview based on 'been' cards only
                                CardsGridView(whichTab: 3)

                            } // End VStack
                                .tabItem {
                                        Image(systemName: "square.grid.2x2")
                                        Text("Collections")
                                }

                                    .padding(.top, 20)

                            VStack (alignment: .leading) {
                                Text("Search...")
                                    .fontWeight(.bold)
                                    .font(.largeTitle)
                                    .padding(.leading)

                                // Instance of the Gridview based on 'been' cards only
                                CardsGridView(whichTab: 4)

                            } // End VStack
                                .tabItem {
                                        Image(systemName: "magnifyingglass")
                                        Text("Search")
                                }

                                    .padding(.top, 20)


                        } // End TabView

                    } // End VStack

                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 65.0))
                        .foregroundColor(Color.purple)
                        .offset(x: 0, y: 360)
                        .ignoresSafeArea()
                        .onTapGesture {
                            showNewPlace.toggle()
                        }

                } // End ZStack
                
            } // End else
           
        } // End Group
        
    } // End body
    
} // End BeenWantView structure

//struct BeenWantView_Previews: PreviewProvider {
//    static var previews: some View {
//        BeenWantView()
//            .environmentObject(TherePlaceViewModel())
//    }
//}
