//
//  PlaceViewModel.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/4/21.
//

import Foundation
import FirebaseAuth

// View model has three place property arrays (see below). Currently outside of the tabview filtering, it only has filtering by type, need to think about how i could incorporate the secondary filter dynamically.

class TherePlaceViewModel: ObservableObject {
    
    var placesArray = [TherePlace]() // placesArray is all places the user has in their account.
    var fullTabArray = [TherePlace]() // fullTabArray is places filtered by tab in TabView.
    @Published var filteredArray = [TherePlace]() // filteredArray is the array published to the views.
    let placeTypes = PlaceTypes()
    
    // TODO - Assume all the firebase calls will come in here.
    
    // Initializer gets the data from the local json file, and creates an array of places for the favorites tab.
    init() {
//        self.placesArray = JsonDataProcessor.getLocalData()
        
        tabArrayFilter(whichTab: 1)
        
    }
    
    func loadUserPlaces() {
        self.placesArray = 
    }
    
    // Function tabArrayFilter filters based on the tab that has been pressed
    func tabArrayFilter(whichTab: Int) {
        
        fullTabArray.removeAll() // each time a tab is pressed, the fullTabArray resets to zero
        
        switch whichTab {
        // Case to create 'favorites' array places (wantOrFav is true)
        case 1: for i in placesArray { if i.wantOrFav { fullTabArray.append(i) } }
        // Case to create 'want to go' array places (wantOrFav is false)
        case 2: for i in placesArray { if !i.wantOrFav { fullTabArray.append(i) } }
        // Case to create 'collections' array // TODO needs fixing
        case 3: for i in placesArray { if i.wantOrFav { fullTabArray.append(i) } }
        // Case to create 'search' array // TODO needs fixing
        case 4: for i in placesArray { if i.wantOrFav { fullTabArray.append(i) } }
        
        default: print("No tab default")
        
        } // End Switch/Case
        
        filteredArray = fullTabArray // As filteredArray is the property published to the view, assign fullTabArray to it.
       
    } // End func tabArraySorter
        
    // Function typeArrayFilter filters based on the type filter bar
    func typeArrayFilter(typeFilter: String) { // only parameter is a string that represents what type has been pressed.
       
        if typeFilter == "All" { filteredArray = fullTabArray } // if 'All' is true, assigns fullTabArray
        else { filteredArray = fullTabArray.filter {$0.placeType! == typeFilter} } // compares function parameter against the placeType property in the place, and filters in if match
    
    } // End function
    
} // End TherePlaceViewModel Class
