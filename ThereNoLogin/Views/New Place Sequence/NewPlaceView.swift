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

    @Binding var typingVar : String
    var suggestion: String

    var body: some View {
        TextField(suggestion, text: $typingVar, onEditingChanged: { (changed) in
                        print("Place Name onEditingChanged - \(changed)")
                    }) {
                        print("Place Name onCommit")
                    }
        .padding()
    } // End body
    
} // End Struct NewPlaceName

//struct NewPlaceView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewPlaceView()
//    }
//}
