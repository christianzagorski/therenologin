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

    var body: some View {
        TextField("Try Yosemite National Park...", text: $newPlaceName, onEditingChanged: { (changed) in
                        print("Username onEditingChanged - \(changed)")
                    }) {
                        print("Username onCommit")
                    }
        .padding()
                    
                    Text("Your new place: \(newPlaceName)")
    
    } // End body
    
} // End Struct NewPlaceName

//struct NewPlaceView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewPlaceView()
//    }
//}
