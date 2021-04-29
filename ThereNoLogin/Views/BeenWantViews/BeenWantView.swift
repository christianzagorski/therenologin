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

        Group {
            if showNewPlace {
                NewPlaceSequence()
                
            } // End if
            
            else {
            
                ZStack {
                    
                    VStack(alignment: .leading) {
                        
                        TopMenuBar()
                        
                        TabView(selection: $selectedTab) {
                            
                            VStack (alignment: .leading){
                                Text("Your favorites")
                                    .fontWeight(.bold)
                                    .font(.largeTitle)
                                    .padding(.leading)
                                
                                SortMenusView()
                                CardsGridView()
                            
                            } // End VStack
                                .tabItem {
                                    Image(systemName: "heart"); Text("Favorites")
                                }
                                .tag(1)
                                .padding(.top, 20)
                        
                            VStack (alignment: .leading) {
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

                            VStack (alignment: .leading) {
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

                            VStack (alignment: .leading) {
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
                        .onChange(of: selectedTab) { newValue in
                                    allPlaces.tabArrayFilter(whichTab: newValue)
                        }

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
