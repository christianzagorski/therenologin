//
//  NewPlaceViewModel.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/9/21.
//

import Foundation

// needs work, have design input now.

struct NewPlaceViewModel {
    
    var theNewPlace = TherePlace()
    
    // Initializing function changes optional variables to empty strings, so that they can be passed into the TextField
    init() {
    
        theNewPlace.placeType = "Hike"
        theNewPlace.placeAddress = ""
        theNewPlace.placeCountry = "USA"
        theNewPlace.placeState = "CA"
        theNewPlace.commentPublic = ""
        theNewPlace.commentPrivate = ""
        theNewPlace.imageName = ""
     
        
    }
    
    // mutating func returns the properties to nil if data has not been entered.
    mutating func returnOptionals() {
        if theNewPlace.placeType == "" {
            self.theNewPlace.placeAddress = nil
        }
        if theNewPlace.placeCountry == "" {
            self.theNewPlace.placeAddress = nil
        }
        if theNewPlace.placeAddress == "" {
            self.theNewPlace.placeAddress = nil
        }
        if theNewPlace.placeState == "" {
            self.theNewPlace.placeState = nil
        }
        if theNewPlace.commentPublic == "" {
            self.theNewPlace.commentPublic = nil
        }
        if theNewPlace.commentPrivate == "" {
            self.theNewPlace.commentPrivate = nil
        }
        if theNewPlace.imageName == "" {
            self.theNewPlace.imageName = nil
        }
        
    } // End Func


}

