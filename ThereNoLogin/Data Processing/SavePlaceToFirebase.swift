//
//  SavePlaceToFirebase.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/26/21.
//

import Foundation
import FirebaseFirestore
//import FirebaseFirestoreSwift
import Combine

// Have started working with firebase, but havent made a lot of progress yet....


class placeRepository: ObservableObject {
    private let path: String = "places"
    
    private let store = Firestore.firestore()
    
    func add(_ newPlace: TherePlace) {
        do {
     //       var newPlacea = try store.collection(path).addDocument(from: newPlace)
            
        } catch {
            fatalError("unable to add card: \(error.localizedDescription).")
        }
    }
    
} // End Struct
