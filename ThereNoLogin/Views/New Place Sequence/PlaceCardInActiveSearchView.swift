//
//  PlaceCardInActiveSearchView.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/29/21.
//

import SwiftUI

struct PlaceCardInActiveSearchView: View {
    
    @EnvironmentObject var newPlaceVM: NewPlaceViewModel
    @EnvironmentObject var placesAPICall: GooglePlacesManager
    var name: String
    var country: String
    
    var body: some View {
        HStack {
            Image("sealers")
                .resizable()
                .frame(width: 70, height: 70)
                .cornerRadius(10.0)
                .padding(.leading)
            VStack (alignment: .leading) {
                Text(verbatim: name)
                    .font(Font.title2.weight(.bold))
                    .padding(.bottom, 5)
                Text("A Hike in \(country)")
                    .font(Font.headline.weight(.light))
                    
            }
                
            Spacer()
        }
        
    }
}

//struct PlaceCardInActiveSearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlaceCardInActiveSearchView()
//    }
//}
