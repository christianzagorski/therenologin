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
    @Published var loadingComplete = true // TODO - need to fix the loading pattern
    
// MARK - loadUserData
    func loadUserData() {}
    
// MARK - loadUserPlaces
    func loadUserPlaces() {
        
// TODO - Code to load the placesIndex document into memory as a dictionary
            // places index will be a document that contains and index of placeindexnumber: placeid
        
// TODO - Code to count the number of places (documents) in the places collection (minus the index document), from the placesIndex document

        
// TODO - code to load each place document (for statement that loops through the documents with the placeid from the placesIndex documente

        //        let currentUserId = Auth.auth().currentUser
        //        let places = db.collection("users").document(currentUserId!.uid).collection("places")

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
        
        
    }
    
    
    func savePlaceToCurrentUser(newPlace: [String: Any]) {
        
        var docId: String = ""
        var numberOfPlaces: Int = 0
        let currentUserId = Auth.auth().currentUser
        let places = db.collection("users").document(currentUserId!.uid).collection("places")
        let placesIndexRef = places.document("placesIndex") //only creates a reference nothing stored until you use set data
        
        // Check that placesIndex exists,
        placesIndexRef.getDocument { (document, error) in
               
            if let documentSnapshot = document, documentSnapshot.exists {
        
        // if it does load placesIndex document and count the number of places
                print("Document data: \(String(describing: document!.data()))")
                let placesIndexDict = document!.data() // Can force unwrap because have checked existence already
                numberOfPlaces = placesIndexDict!.count
                print( "Number of places in user profile: \(numberOfPlaces)" )
                
            }
        
            // and if not create it
            else {
                print("Document does not exist")
                placesIndexRef.setData([:])
                numberOfPlaces = 0
            }
        }
        // This section saves document of the place to the collection, and gets the doc id.
        print("hello saveplacetocurrentuser")
            // create empty document
        let newDoc = places.document()
            // get the new document ID
        docId = newDoc.documentID
            // Set the newPlace to the new document
        newDoc.setData(newPlace) { err in
            if let err = err {
                print("Error writing document: \(err)")
            }
            else {
                print("Document successfully written!")
            }
        }
        
        // Add newplace documentID to the placesIndex document
            placesIndexRef.updateData([numberOfPlaces + 1: docId]) { err in
                if let err = err {
                    print("Error updating document: \(err)")
                }
                else {
                    print("newPlace DocumentID successfully updated to the placesIndex document")
                }
            } // End updataData submethod
        
    } // End savePlaceToCurrentUser Method
    
    // TODO - move this into loadcurrentuser
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
   
    // TODO - This is for storage
    func testReferences() {
        let storageRef = storage.reference()
        let imagesRef = storageRef.child("images")
        let imagefileRef = imagesRef.child("chowchilla.jpg")
        print("bucket \(storageRef.bucket)")//works
        print("child images: \(imagesRef)") //works
        print("child images with .fullpath: \(imagesRef.fullPath)") //just gives "images"
        print("image file path: \(imagefileRef)")
        
        
    } // End testReferences method
    
    // TODO - fix for storage
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

    // TODO - incorporate into 'loadUserData' method
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
    
    // TODO - move code that checks places index and creates if needed from savePlacetocurrent user so that it can be used by loadcurrentuser and other methods if needed
    func checkPlacesIndex () {} // End checkPlacesIndex method

} // end FirebaseDataProcessor Class


