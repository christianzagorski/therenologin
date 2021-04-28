//
//  WantCardView.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/5/21.
//

import SwiftUI

struct CardsGridView: View {
    
    @EnvironmentObject var allPlaces: TherePlaceViewModel
    var whichTab: Int
    var layout1: [GridItem] = [GridItem(.flexible(minimum: 40), spacing: -15),GridItem(.flexible(minimum: 40), spacing: -15)]
        //Array(repeating: .init(.flexible()), count: 2) // Alternative syntax
    let waySorted = 1
    let typeFilter = "Hike"
    
    var body: some View {
        
        let cardsToDisplayArray = allPlaces.cardArrayViewCreator(allPlacesArray: allPlaces.placesArray, whichTab:whichTab, typeFilter: typeFilter, waySorted: waySorted)
        
        NavigationView {
            
            ScrollView {
                    
                LazyVGrid(columns: layout1, spacing: 10) {
                    
                        ForEach(cardsToDisplayArray, id: \.id) {
                            
                            placeCard in
                            
                            NavigationLink(
                                destination: PlaceView(place: placeCard),
                                
                                label: {
                                    
                                    CardView(card: placeCard)
                                    
                                } // End label for Navigation Link
                                
                            ) // End Argument list for Navigation Link

                        } // End ForEach
                    
                } // End LazyVGrid
                .padding(.top, 20)
                .padding(.bottom, 20)
                
            } // End ScrollView
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .background(Color.gray.opacity(0.15))
            
            
        } // End Navigation View

    } // End body
    
 
} // End struct

//struct WantCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        WantCardView()
//    }
//}
