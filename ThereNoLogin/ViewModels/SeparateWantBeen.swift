//
//  SeparateWantBeen.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/5/21.
//

import Foundation

class SeparateWantBeen: ObservableObject {
    
    func wantArrayCreator(allPlacesArray: [TherePlace]) -> [TherePlace] {
        var appendArray = [TherePlace]()
        
        for i in allPlacesArray {
            
            if i.wantToGo {
                print("hellloooo")
                appendArray.append(i)
                
            } // end if statement

            else {
            
            }

        } // End for loop
        
        return appendArray
    } // End function

    
} // End class
