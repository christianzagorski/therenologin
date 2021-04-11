//
//  NewPlaceViewModel.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/9/21.
//

import Foundation

class NewPlaceViewModel: ObservableObject {
    
    @Published var aNewPlace: TherePlace
    
    
    init() {
     
        self.aNewPlace = TherePlace()
    }
//    newPlace.placeName = "hello"
    
//    let tempPlace = newPlace
//
//    newPlace.self = tempPlace
    
}
