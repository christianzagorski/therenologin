//
//  PlaceViewModel.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/4/21.
//

import Foundation

class TherePlaceViewModel: ObservableObject {
    
    @Published var placesArray = [TherePlace]()
    
    // Initializer gets the data from the local json file
    init() {
        self.placesArray = JsonDataProcessor.getLocalData()
    }
    
    // Function cardArrayViewCreator takes all the places and arguments on how the user wants it sorted and generates the places for that view.
    func cardArrayViewCreator(allPlacesArray: [TherePlace], whichTab: Int, typeFilter: Int?, waySorted: Int) -> [TherePlace] {
        
        var appendArray = [TherePlace]()
        
        if whichTab == 1 { // Want to go tab
        
            for i in allPlacesArray {
                                
                if !i.wantOrFav {
                    appendArray.append(i)
                } // end if statement
                
                else {}
                
            } // End for loop
        
        } // End if for 'want' view
            
        else if whichTab == 2 { // Favorites tab
            
            for i in allPlacesArray {
                                
                if i.wantOrFav {
                    appendArray.append(i)
                } // end if statement
                
                else {}
                
            } // End for loop
        
        } // End if for 'favorites'
        
        else if whichTab == 3 { // Collections tab
            
            for i in allPlacesArray {
                                
                if i.wantOrFav {
                    appendArray.append(i)
                } // end if statement
                
                else {}
                
            } // End for loop
        
        } // End if for 'Collections
        
        else if whichTab == 4 { // Search tab
            
            for i in allPlacesArray {
                                
                if i.wantOrFav {
                    appendArray.append(i)
                } // end if statement
                
                else {}
                
            } // End for loop
        
        } // End if for 'Search'
        
        return appendArray
        
    } // End function
    
   
    
} // End TherePlaceViewModel Class
