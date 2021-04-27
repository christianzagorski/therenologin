//
//  CardView.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/6/21.
//

import SwiftUI

struct CardView: View {

    @EnvironmentObject var allPlaces: TherePlaceViewModel
    var card: TherePlace
    
    var body: some View {
        
        ZStack {
            Color.white

            GeometryReader { geo in
            
                VStack (alignment: .leading) {
                    
                    Image(card.imageName!) // TODO force unwrapped fix
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
                        
                    
                    Text("\(card.placeType!) in \(card.placeSuburb!), \(card.placeCountry!)")// TODO Force unwrapped for now
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
    
    } // End body

} // End Struct

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView()
//    .environmentObject(TherePlaceViewModel())
//    }
//}
