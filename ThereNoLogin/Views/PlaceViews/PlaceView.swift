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
                if let placePropertyIfExists = place.placeType {
                    Text("Type: \(placePropertyIfExists)")
                }
                else {
                    Text("Place Type is nil")
                }
                if let placePropertyIfExists = place.placeAddress {
                    Text("Address: \(placePropertyIfExists)")
                }
                else {
                    Text("Address is nil")
                }
                if let placePropertyIfExists = place.placeState {
                    Text("State: \(placePropertyIfExists)")
                }
                else {
                    Text("State is nil")
                }
                if let placePropertyIfExists = place.placeCountry {
                    Text("Country \(placePropertyIfExists)")
                }
                else {
                    Text("Country is nil")
                }
                if let placePropertyIfExists = place.placeCountryCode {
                    Text("CountryCode \(placePropertyIfExists)")
                }
                else {
                    Text("CountryCode is nil")
                }
            } // End Group
            Group {
                if let placePropertyIfExists = place.commentPublic {
                    Text("Public Comment: \(placePropertyIfExists)")
                }
                else {
                    Text("Public Comment is nil")
                }
                if let placePropertyIfExists = place.commentPrivate {
                    Text("Private Comment: \(placePropertyIfExists)")
                }
                else {
                    Text("Private Comment is nil")
                }
                if let placePropertyIfExists = place.imageName {
                    Text("ImageName: \(placePropertyIfExists)")
                }
                else {
                    Text("ImageName is nil")
                }
                Text("Want To Go Bool: \(String(place.wantToGo))")
                Text("Been To Bool: \(String(place.beenTo))")
                Text("Private Spot: \(String(place.privateSpot))")
                if let placePropertyIfExists = place.whenAdded {
                    Text("When Added: \(placePropertyIfExists)")
                }
                else {
                    Text("whenAdded is nil")
                }
                
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
