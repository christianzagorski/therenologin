//
//  SavePlaceToFirebase.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/26/21.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseStorage
import Combine

// Have started working with firebase, but havent made a lot of progress yet....

struct FirebaseDataProcessor {
    let currentuser = "5Ud4EbTmXuN2LkXL2T4w"
    let storage = Storage.storage()
    let db = Firestore.firestore()
    
   
    func testReferences() {
        let storageRef = storage.reference()
        let imagesRef = storageRef.child("images")
        let imagefileRef = imagesRef.child("chowchilla.jpg")
        print("bucket \(storageRef.bucket)")//works
        print("child images: \(imagesRef)") //works
        print("child images: \(imagesRef.fullPath)") //just gives "images"
        print("image file path: \(imagefileRef)")
        
        
    }
    
    func testMyFirebasePhotoJpg() -> UIImage {

        let storageRef = storage.reference()
        let imagesRef = storageRef.child("images")
        let imagefileRef = imagesRef.child("chowchilla.jpg")
        
        
        //        let storageRef = storage.reference()
//        print("Storage reference \(String(storageRef.fullPath))")
//        let imagesRef = storageRef.child("images")
//        var spaceRef = storageRef.child("images/chowchilla.jpg")
//        let path = spaceRef.fullPath
//        print("full path reference \(path))")
//        let myRef = storageRef.child("images/island.jpg")
        
        //let pathReference = storage.reference(withPath: "images/chowchilla.jpg")
        var myImage = UIImage()
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        imagefileRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
          if let error = error {
            
            print("an error occured \(error)")
            // Uh-oh, an error occurred!
          } else {
            // Data for "images/island.jpg" is returned
            let image = UIImage(data: data!)
            myImage = image!
          }
        }
        
        return myImage
    }
    func addNewPlace(newPlace: TherePlace) {
        
        
       
        
        let currentUserPlaces = db.collection("users/\(currentuser)/places")
            //.collection("Orders/orderid123/Products").get()
        
        //Create a doc with given identifier
       // currentUserPlaces.document(newPlace.placeName).setData(["placeType":newPlace.placeType!, "placeName":newPlace.placeName,"wantOrFav":newPlace.wantOrFav,"privateSpot":newPlace.privateSpot])
        //Create a doc with unique identifer
        currentUserPlaces.document().setData(["placeType":newPlace.placeType!, "placeName":newPlace.placeName,"wantOrFav":newPlace.wantOrFav,"privateSpot":newPlace.privateSpot])
        
        //Create doc with given data
        
        
        
    }




}

//class placeRepository: ObservableObject {
//    private let path: String = "places"
//
//    private let store = Firestore.firestore()
//
//    func add(_ newPlace: TherePlace) {
//        do {
//     //       var newPlacea = try store.collection(path).addDocument(from: newPlace)
//
//        } catch {
//            fatalError("unable to add card: \(error.localizedDescription).")
//        }
//    }
//
//} // End Struct
