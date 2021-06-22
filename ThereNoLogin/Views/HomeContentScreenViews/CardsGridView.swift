//
//  WantCardView.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/5/21.
//

import SwiftUI

// Uses a navigation view, scrollview and lazyVgrid to display cards that each represent a place. Set at 2 cards across, will need to make this device dynamic at some point.

struct CardsGridView: View {
    
    @EnvironmentObject var allPlaces: TherePlaceViewModel
    var gridLayout: [GridItem] = [GridItem(.flexible(minimum: 40), spacing: -15),GridItem(.flexible(minimum: 40), spacing: -15)]
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                    
                LazyVGrid(columns: gridLayout, spacing: 10) {
                    
                    ForEach(allPlaces.filteredArray, id: \.id) {
                            
                            placeCard in
                            
                            NavigationLink(
                                destination: PlaceView(place: placeCard),
                                
                                label: { CardView(card: placeCard) }
                                
                            ) // End Argument list for Navigation Link

                        } // End ForEach
                    
                } // End LazyVGrid
                .padding(.top, 20)
                .padding(.bottom, 20)
                
            } // End ScrollView
            .navigationBarHidden(true)
            .background(Color.gray.opacity(0.15))
            
        } // End Navigation View

    } // End body
 
} // End struct
