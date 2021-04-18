//
//  PlaceView.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/4/21.
//

import SwiftUI
// This is the full screen view where the detail on the place is shown. It has a large image as a pinned header. When scroll down, all information about the place is shown. from this screen you can share the place with a friend, remove from want or been list, edit the place information, delete the place alltogether, etc.

struct PlaceView: View {
    
    var place: TherePlace
    @EnvironmentObject var allPlaces: TherePlaceViewModel
    
    var body: some View {
        VStack {
            Group {
                Text("Name: \(place.placeName)")
                Text("Type: \(place.placeType)")
                if let placePropertyIfExists = place.placeAddress {
                    Text("Address: \(placePropertyIfExists)")
                }
                if let placePropertyIfExists = place.placeState {
                    Text("State: \(placePropertyIfExists)")
                }
                Text("Country: \(place.placeCountry)")
                if let placePropertyIfExists = place.placeCountryCode {
                    Text("CountryCode \(placePropertyIfExists)")
                }
            } // End Group
            Group {
                if let placePropertyIfExists = place.commentPublic {
                    Text("Public Comment: \(placePropertyIfExists)")
                }
                if let placePropertyIfExists = place.commentPrivate {
                    Text("Private Comment: \(placePropertyIfExists)")
                }
                if let placePropertyIfExists = place.imageName {
                    Text("ImageName: \(placePropertyIfExists)")
                }
                Text("Want To Go Bool: \(String(place.wantToGo))")
                Text("Been To Bool: \(String(place.beenTo))")
                Text("Private Spot: \(String(place.privateSpot))")

            }
        }
        
        
    }
}

//struct PlaceView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlaceView()
//            .environmentObject(TherePlaceViewModel())
//    }
//}
