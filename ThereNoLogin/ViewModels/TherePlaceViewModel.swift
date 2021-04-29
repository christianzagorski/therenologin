//
//  PlaceViewModel.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/4/21.
//

import Foundation

class TherePlaceViewModel: ObservableObject {
    
    @Published var placesArray = [TherePlace]()
    @Published var fullTabArray = [TherePlace]()
    @Published var filteredArray = [TherePlace]()
    
    // Initializer gets the data from the local json file
    init() {
        self.placesArray = JsonDataProcessor.getLocalData()
        print(placesArray[0].placeName)
        print("breakpoint here")
    }
    
    // Function tabArrayFilter filters based on the tab that has been pressed
    func tabArrayFilter(whichTab: Int) {
        fullTabArray.removeAll()
        switch whichTab {
        case 1: for i in placesArray {
                                
                if i.wantOrFav { fullTabArray.append(i) } // End if for way sorted
                
            } // End for loop

        case 2: for i in placesArray {
                                
                if !i.wantOrFav { fullTabArray.append(i) } // end if statement
                
            } // End for loop

        case 3: for i in placesArray {
                                
                if i.wantOrFav { fullTabArray.append(i) } // end if statement
                
            } // End for loop
            
        case 4: for i in placesArray {
                                
                if i.wantOrFav { fullTabArray.append(i) } // end if statement
                
            } // End for loop
        
        default: print("No tab default")
        
        } // End Switch/Case
        
        filteredArray = fullTabArray
       
    } // End func tabArraySorter
        
    func typeArrayFilter(typeFilter: String) {
       
        if typeFilter == "All" {
            filteredArray = fullTabArray
        }
        else {
            filteredArray = fullTabArray.filter {$0.placeType! == typeFilter}
        }
    
    } // End function
    
} // End TherePlaceViewModel Class
