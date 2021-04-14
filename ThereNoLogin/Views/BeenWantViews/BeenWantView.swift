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
    
    
    var body: some View {
        
        Group {
            if showNewPlace {
                NewPlaceSequence()
                
            } // End if
            
            else {
            
                VStack {
                    
                    Image(systemName: "plus.circle")
                        .font(.system(size: 76.0))
                        .onTapGesture {
                            showNewPlace.toggle()
                        }
                    TabView {
                        
                        
                            // Instance of the Gridview based on 'want' cards only
                            CardsGridView(beenOrWant: "want")
                            .tabItem {
                                Image(systemName: "lock.rectangle.fill")
                                Text("Want to go there")
                            }
                        

                            // Instance of the Gridview based on 'been' cards only
                            CardsGridView(beenOrWant: "been")
                                .tabItem {
                                    Image(systemName: "lock.rectangle.fill")
                                    Text("Been there")
                            }
               
                    } // End TabView
                    
                } // End VStack
            
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
