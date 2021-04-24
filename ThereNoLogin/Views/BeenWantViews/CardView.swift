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
        
    //GeometryReader { geo in
        
        ZStack {
            Color.white
//            Rectangle()
//                .foregroundColor(Color.black.opacity(0.0))
            GeometryReader { geo in
            
                VStack {
                Image(card.imageName!)
                    .resizable()
                    .scaledToFill()
                    .aspectRatio(1.65, contentMode: .fit)
                    
                    Spacer()
                    
                    Text(card.placeName)
                    .foregroundColor(Color.black)
                        .padding(.bottom)
            
                }
                
            }
            
                
            
            
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .aspectRatio(0.8, contentMode: .fill)
        .cornerRadius(10)
        .padding(.leading)
        .padding(.trailing)
        .padding(.top, 5)
        

        
        
//            Image("bar")
//                .resizable()
//                .scaledToFill()
//                .frame(minWidth: 0, maxWidth: .infinity)
//                .aspectRatio(0.8, contentMode: .fill)
//                .clipped()
//                .cornerRadius(10)
//                .padding(.leading)
        
//        ZStack {
//
//                Image("bar")
//
//
//                Text(card.placeName)
//                    .foregroundColor(.black)
//
//            } // End ZStack
//            .frame(width: .infinity, height: 180)
//            .padding(.leading)
//            .padding(.trailing)
//            .cornerRadius(10)
//
//        //} // End Geo reader
    
    } // end body
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView()
//    .environmentObject(TherePlaceViewModel())
//    }
//}
