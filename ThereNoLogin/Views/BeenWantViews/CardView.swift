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
        
        Rectangle()
            .foregroundColor(.gray)
            .frame(width: .infinity, height: 180, alignment: .leading)
            
        Text(card.placeName)
            .foregroundColor(.black)
        } // End ZStack
        .padding(.leading)
        .padding(.trailing)
    }
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView()
//    .environmentObject(TherePlaceViewModel())
//    }
//}
