//
//  NewPlaceViewModel.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/9/21.
//

import Foundation

// needs work, have design input now.

class NewPlaceViewModel: ObservableObject {
    
    @Published var aNewPlace = TherePlace()
    @Published var aNewPlaceNoOptionals = NewTherePlace()
    @Published var showNewPlace: Bool = false
    @Published var goToConfigView: Bool = false
    
    // TODO - rename this and clean up
    func testDictionaryExtension() -> [String: Any] {
        let a = aNewPlace
        print("Dictionary extension has converted aNewPlace object to an extension")
        let b = a.dictionary1
        return b!
    }
    

    // func returns the properties to nil if data has not been entered.
    func returnNoOptionals() {
        
        aNewPlace.id = UUID()
        
        aNewPlace.placeName = aNewPlaceNoOptionals.placeName
        
        aNewPlace.wantOrFav = aNewPlaceNoOptionals.wantOrFav
        
        aNewPlace.privateSpot = aNewPlaceNoOptionals.privateSpot
        
        if aNewPlaceNoOptionals.placeType == "" { self.aNewPlace.placeType = nil }
        else { aNewPlace.placeType = aNewPlaceNoOptionals.placeType }
        
        if aNewPlaceNoOptionals.placeSuburb == "" { self.aNewPlace.placeSuburb = nil }
        else { aNewPlace.placeSuburb = aNewPlaceNoOptionals.placeSuburb }
        
        if aNewPlaceNoOptionals.placeCountry == "" { self.aNewPlace.placeCountry = nil }
        else { aNewPlace.placeCountry = aNewPlaceNoOptionals.placeCountry }
        
        if aNewPlaceNoOptionals.placeAddress == "" { self.aNewPlace.placeAddress = nil }
        else { aNewPlace.placeAddress = aNewPlaceNoOptionals.placeAddress }
        
        if aNewPlaceNoOptionals.placeState == "" { self.aNewPlace.placeState = nil }
        else { aNewPlace.placeState = aNewPlaceNoOptionals.placeState }
        
        if aNewPlaceNoOptionals.commentPublic == "" { self.aNewPlace.commentPublic = nil }
        else { aNewPlace.commentPublic = aNewPlaceNoOptionals.commentPublic }
        
        if aNewPlaceNoOptionals.commentPrivate == "" { self.aNewPlace.commentPrivate = nil }
        else { aNewPlace.commentPrivate = aNewPlaceNoOptionals.commentPrivate }
        
        if aNewPlaceNoOptionals.imageName == "" { self.aNewPlace.imageName = nil }
        else { aNewPlace.imageName = aNewPlaceNoOptionals.imageName }
        
    } // End Func
    
    // TODO - need to make a method (or decide where else it should go) that clears all properties when you click back and/or you 'add new place'

} // End Class

