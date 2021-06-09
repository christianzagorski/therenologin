//
//  SavePlaceToFirebase.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/26/21.
//
// Handles all data queries and writes to Firestore and Firebase Storage

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseStorage
import Combine
import FirebaseAuth

class FirebaseDataProcessor: ObservableObject {
    
// MARK - Properties
    let storage = Storage.storage()
    let db = Firestore.firestore()
    @Published var currentUsername: String = ""
    @Published var loadingComplete = true
    
// MARK - loadUserData
    func loadUserData() {}
    
// MARK - loadUserPlaces
    func loadUserPlaces() {}
    
    
    func savePlaceToCurrentUser() {
        print("hello saveplacetocurrentuser")
    }
    
    func getCurrentUsername() {
        
        let currentUserId = Auth.auth().currentUser
        
        let document = db.collection("users").document(currentUserId?.uid ?? "nil")
        
        document.getDocument { (docSnapshot, error) in
            //Check for error and handle
            
            if let error = error {
                // handle error
                print("error getting document from firebase: \(error.localizedDescription)")
                
            } else if let docSnapshot = docSnapshot {
                if let userData = docSnapshot.data() {
                    self.currentUsername = userData["name"] as! String // TODO fix force unwrap here
                }
                else {
                    self.currentUsername = "nilname"
                }
        
            } else {
                // No data returned, handle appropriately
                print("error: no data returned from document call")
            }
        } // end getDocument call
        
    } // End getCurrentUsername method
   
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

    func saveFirstName(name: String) {
        
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                    let currentUser = Auth.auth().currentUser
                    let cleansedFirstName = name.trimmingCharacters(in: .whitespacesAndNewlines)
                    let db = Firestore.firestore()
                    let path = db.collection("users").document(currentUser!.uid)
                    path.setData(["name":cleansedFirstName]) { error in
                        
                    }
                self.getCurrentUsername()
                    
                } // end If
                
        }
       
    } // End saveFirstName Method

} // end FirebaseDataProcessor Class


