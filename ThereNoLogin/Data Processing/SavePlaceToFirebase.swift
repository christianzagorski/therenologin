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
import FirebaseAuth

// Have started working with firebase, but havent made a lot of progress yet....

struct FirebaseDataProcessor {
    
    
    // let currentuser = "5Ud4EbTmXuN2LkXL2T4w"
    let storage = Storage.storage()
    let db = Firestore.firestore()
    
   
    func testReferences() {
        let storageRef = storage.reference()
        let imagesRef = storageRef.child("images")
        let imagefileRef = imagesRef.child("chowchilla.jpg")
        print("bucket \(storageRef.bucket)")//works
        print("child images: \(imagesRef)") //works
        print("child images with .fullpath: \(imagesRef.fullPath)") //just gives "images"
        print("image file path: \(imagefileRef)")
        
        
    } // End testReferences method
    
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
        print("line before getData call")
        imagefileRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
        print("line after getData call")
          if let error = error {
            
            print("an error occured \(error)")
            // Uh-oh, an error occurred!
          } else {
            // Data for "images/island.jpg" is returned
            print("line before storing the image to a property")
            let image = UIImage(data: data!)
            myImage = image!
          }
        }
        
        return myImage
    } // end testMyFirebasePhotoJpg method
    
//    func addNewPlace(newPlace: TherePlace) {
//
//        let currentUserPlaces = db.collection("users/\(currentuser)/places")
//            //.collection("Orders/orderid123/Products").get()
//
//        //Create a doc with given identifier
//       // currentUserPlaces.document(newPlace.placeName).setData(["placeType":newPlace.placeType!, "placeName":newPlace.placeName,"wantOrFav":newPlace.wantOrFav,"privateSpot":newPlace.privateSpot])
//        //Create a doc with unique identifer
//        currentUserPlaces.document().setData(["placeType":newPlace.placeType!, "placeName":newPlace.placeName,"wantOrFav":newPlace.wantOrFav,"privateSpot":newPlace.privateSpot])
//
//        //Create doc with given data
//
//    } // End addNewPlace method

    func saveFirstName(name: String) {
        
        if let currentUser = Auth.auth().currentUser {
        
            let cleansedFirstName = name.trimmingCharacters(in: .whitespacesAndNewlines)
                
            let db = Firestore.firestore()
            let path = db.collection("users").document(currentUser.uid)
            path.setData(["name":cleansedFirstName]) { error in
                
                if error == nil {
                    // Saved
                }
                else {
                    // Error
                }
            }
        }
        
    } // End saveFirstName Method


}


