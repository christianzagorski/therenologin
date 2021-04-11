//
//  NewPlaceView.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/7/21.
//

import SwiftUI
// This is the view where the user adds a new place. There should be opportunity to add a photo either from camera, photo gallery, or online. As the user types it should look up the google api for the place as suggestion.

// V1 probably no photo, just information that is entered via text boxes
struct NewPlaceView: View {

    @State var newPlaceName: String = ""
    @EnvironmentObject var allPlaces: TherePlaceViewModel
    @EnvironmentObject var newPlace: NewPlaceViewModel

    var body: some View {
        
        Text("hello")
//        TextField("Try Yosemite National Park...", text: $newPlace.placeName, onEditingChanged: { (changed) in
//                        print("Place Name onEditingChanged - \(changed)")
//                    }) {
//                        print("Place Name onCommit")
//                    }
//        .padding()
//
//        Text("Your new place: \(newPlace.placeName))")
    
    } // End body
    
} // End Struct NewPlaceName

//struct NewPlaceView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewPlaceView()
//    }
//}
