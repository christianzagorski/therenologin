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
    @State var sortStyleCode = 1
    var sortStyleOptions = ["Most Recent", "By Country", "Nearby"]
    let types = ["Hike", "Camping Spot", "Bar", "Eatery", "Accomodation", "Other"]
    @State var placeTypeCode = 0
    
    
    var body: some View {

        Group {
            if showNewPlace {
                NewPlaceSequence()
                
            } // End if
            
            else {
            
                ZStack {
                    
                    VStack(alignment: .leading) {
                        Text("Your Favorites")
                            .font(.largeTitle)
                            .padding()
                        
                        
                            
                        Menu {
                            Button(action: {
                                sortStyleCode = 0
                            }) {
                                Label(sortStyleOptions[0], systemImage: "doc")
                            }

                            Button(action: {
                                sortStyleCode = 1
                            }) {
                                Label(sortStyleOptions[1], systemImage: "folder")
                            }
                            Button(action: {
                                sortStyleCode = 2
                            }) {
                                Label(sortStyleOptions[2], systemImage: "folder")
                            }
                        
                        } // End Menu
                        
                        
                        label: {
                            Label(sortStyleOptions[sortStyleCode], systemImage: "arrow.down")
                        }
                        .padding(.bottom)
                        
                        Picker("Types", selection: $placeTypeCode) {
                            ForEach(types, id: \.self) {
                                                        Text($0)
                            }

                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.bottom)
                        
                        TabView {
                            
                            
                                // Instance of the Gridview based on 'want' cards only
                                CardsGridView(beenOrWant: "want")
                                .tabItem {
                                    Image(systemName: "bookmark")
                                    Text("Want to Go")
                                }
                                    .padding(.bottom, 50)
                            

                                // Instance of the Gridview based on 'been' cards only
                                CardsGridView(beenOrWant: "been")
                                .tabItem {
                                        Image(systemName: "heart")
                                        Text("Favorites")
                                }
                                    .padding(.bottom, 50)
                   
                        } // End TabView
                        .ignoresSafeArea()
                    
                        
                    } // End VStack
                    
                    Image(systemName: "plus.circle")
                        .font(.system(size: 65.0))
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
