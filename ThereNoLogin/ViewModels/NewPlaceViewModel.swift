//
//  NewPlaceViewModel.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/9/21.
//

import Foundation

// needs work, have design input now.

class NewPlaceViewModel: ObservableObject{
    
    @Published var aNewPlace = TherePlace()
    
    // Initializing function changes optional variables to empty strings, so that they can be passed into the TextField
    init() {
    
//        theNewPlace.placeType = "Hike"
//        theNewPlace.placeAddress = ""
//        theNewPlace.placeCountry = "USA"
//        theNewPlace.placeState = "CA"
//        theNewPlace.commentPublic = ""
//        theNewPlace.commentPrivate = ""
//        theNewPlace.imageName = ""
     
    }
    
    // func returns the properties to nil if data has not been entered.
    func returnOptionals() {
        if aNewPlace.placeType == "" {
            self.aNewPlace.placeAddress = nil
        }
        if aNewPlace.placeCountry == "" {
            self.aNewPlace.placeAddress = nil
        }
        if aNewPlace.placeAddress == "" {
            self.aNewPlace.placeAddress = nil
        }
        if aNewPlace.placeState == "" {
            self.aNewPlace.placeState = nil
        }
        if aNewPlace.commentPublic == "" {
            self.aNewPlace.commentPublic = nil
        }
        if aNewPlace.commentPrivate == "" {
            self.aNewPlace.commentPrivate = nil
        }
        if aNewPlace.imageName == "" {
            self.aNewPlace.imageName = nil
        }
        
    } // End Func


}

