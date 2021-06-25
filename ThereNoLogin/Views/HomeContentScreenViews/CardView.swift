//
//  CardView.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/6/21.
//

import SwiftUI

// this view creates each card for the grid with image, place name and some other details.

struct CardView: View {

    @EnvironmentObject var allPlaces: TherePlaceViewModel
    @EnvironmentObject var placesAPICall: GooglePlacesManager
    
    var card: TherePlace
    
    var body: some View {
        
        ZStack {
            Color.white

            GeometryReader { geo in
            
                VStack (alignment: .leading) {
                    
                    Image(uiImage: allPlaces.imageTest)
//                    Image(uiImage: allPlaces.imagesDict[card.imageName!]!) // TODO force unwrapped fix
                        .resizable()
                        .frame(width: geo.size.width, height: geo.size.height * 0.45)
                        .scaledToFill()
                    
                    Spacer()
                    
                    Text(card.placeName)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .padding(.bottom)
                        .padding(.leading, 15)
                        .font(.system(size: 18))
                        
                    
                    Text("\(card.placeType ?? "nil") in \(card.placeSuburb ?? "nil"), \(card.placeCountry ?? "nil")")// TODO Force unwrapped for now
                        .foregroundColor(Color.gray)
                        .padding(.bottom)
                        .padding(.leading, 15)
                        .padding(.trailing, 15)
                        .font(.system(size: 14))
                    
                    Spacer()
            
                } // End VStack
                
            } // End Geo Reader
             
        } // End ZStack
        .aspectRatio(0.75, contentMode: .fill)
        .cornerRadius(10)
        .padding(.leading)
        .padding(.trailing)
        .padding(.top, 5)
        .onAppear() {
            print("card imagename")
            print(card.imageName!)
        }
    
    } // End body

} // End Struct

