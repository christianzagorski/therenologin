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
    @Published var imagesDict = [String : UIImage]()
    var fullTabArray = [TherePlace]() // fullTabArray is places filtered by tab in TabView.
    @Published var filteredArray = [TherePlace]() // filteredArray is the array published to the views.
    let placeTypes = PlaceTypes()
    @Published var imageTest = UIImage()
    
    // TODO - Assume all the firebase calls will come in here.
    
    // Pre to Firebase being loaded, the initializer got the data from the local json file, and creates an array of places for the favorites tab.
    init() {
//        self.placesArray = JsonDataProcessor.getLocalData()
        tabArrayFilter(whichTab: 1)
    }
    
    func loadUserPlaces(firebaseLoadedPlaces: [TherePlace]) {
        let photoLoadSequence = PhotoService()
        
        for eachplace in firebaseLoadedPlaces {
            print("Eachplace.imagename \(eachplace.imageName!)")
          
            photoLoadSequence.loadPhoto(filename: eachplace.imageName!, userCompletionHandler: {placeImage, error in
                self.imagesDict[eachplace.imageName!] = placeImage
                print("hello")
                print(self.imagesDict)
                self.placesArray = firebaseLoadedPlaces
                self.tabArrayFilter(whichTab: 1)
                self.imageTest = photoLoadSequence.myimageToPass
                
            })
        }
        
        
        
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
