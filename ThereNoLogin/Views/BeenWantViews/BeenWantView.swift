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
    @State var selectedTab = 1
    
    init() {
            UITabBar.appearance().barTintColor = UIColor.white
        }
    
    var body: some View {

        Group { // Using group view to instantiate the NewPlaceSequence when the button is pressed (state value updates)
            if showNewPlace {
                //NewPlaceSequence()
                NewPlaceSequence()
                
            } // End if
            
            else {
            
                ZStack {
                    
                    VStack(alignment: .leading, spacing: 0) {
                        
                        TopMenuBar() // User Info, map view button & some other info
                        
                        // The tabview will be the main navigation window. First shows a title, then some sort menus, then the main card grid.
                        TabView(selection: $selectedTab) {
                            
                            VStack (alignment: .leading, spacing: 0){  // First tab - favorites
                                Text("Your favorites")
                                    .fontWeight(.bold)
                                    .font(.largeTitle)
                                    .padding(.leading)
                                
                                SortMenusView() // Shows two menus for sorting vertically stacked
                                CardsGridView() // the main view with the places cards.
                            
                            } // End VStack
                                .tabItem {
                                    Image(systemName: "heart"); Text("Favorites")
                                }
                                .tag(1)
                                .padding(.top, 20)
                        
                            VStack (alignment: .leading) { // Second tab - Want to go
                                Text("Want to go")
                                    .fontWeight(.bold)
                                    .font(.largeTitle)
                                    .padding(.leading)

                                SortMenusView()
                                CardsGridView()

                            } // End VStack
                                .tabItem {
                                    Image(systemName: "bookmark"); Text("Want to go")
                                }
                                .tag(2)
                                .padding(.top, 20)

                            VStack (alignment: .leading) { // Third tab - collections
                                Text("Your collections")
                                    .fontWeight(.bold)
                                    .font(.largeTitle)
                                    .padding(.leading)

                                SortMenusView()
                                CardsGridView()

                            } // End VStack
                                .tabItem {
                                    Image(systemName: "square.grid.2x2"); Text("Collections")
                                }
                                .tag(3)
                                .padding(.top, 20)

                            VStack (alignment: .leading) { // Forth tab - Search
                                Text("Search...")
                                    .fontWeight(.bold)
                                    .font(.largeTitle)
                                    .padding(.leading)

                                CardsGridView()

                            } // End VStack
                                .tabItem {
                                    Image(systemName: "magnifyingglass"); Text("Search")
                                }
                                .tag(4)
                                .padding(.top, 20)


                        } // End TabView
                        // When tab is pressed, the viewmodel creates a new tabArray specific to the tab being pressed, and defaults to no filters applied.
                        .onChange(of: selectedTab) { newValue in
                                    allPlaces.tabArrayFilter(whichTab: newValue)
                        }

                    } // End VStack

                    Image(systemName: "plus.circle.fill") // Over the TabView is the add button
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
