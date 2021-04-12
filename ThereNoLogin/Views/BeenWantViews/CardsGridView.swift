//
//  WantCardView.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/5/21.
//

import SwiftUI

struct CardsGridView: View {
    
    @EnvironmentObject var allPlaces: TherePlaceViewModel
    var beenOrWant: String
    var layout1: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        
        let cardsToDisplayArray = allPlaces.arrayCreator(allPlacesArray: allPlaces.placesArray, beenOrWant: beenOrWant)
        
        NavigationView {
            
            ScrollView {
                    
                LazyVGrid(columns: layout1, spacing: 10) {
                    
                        ForEach(cardsToDisplayArray) {
                            
                            placeCard in
                            
                            NavigationLink(
                                destination: PlaceView(place: placeCard),
                                
                                label: {
                                    
                                    CardView(card: placeCard)
                                    
                                    
                                } // End label for Navigation Link
                                
                                
                            ) // End Argument list for Navigation Link
                            
                            
                            
                        } // End ForEach
                    
                } // End LazyVGrid
                
            } // End ScrollView
            
        } // End Navigation View

    } // End body
 
} // End struct

//struct WantCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        WantCardView()
//    }
//}
