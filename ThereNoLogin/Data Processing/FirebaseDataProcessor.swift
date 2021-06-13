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
//    var loadedPlace: TherePlace
    
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
        let places = db.collection("users").document(currentUserId!.uid).collection("places") // Places Collection
        let fullrefplacesIndex = db.collection("users").document(currentUserId!.uid).collection("places").document("placesIndex")
        let placesWithoutIndex = places.whereField("placeName", isNotEqualTo: "")
        
        print("loadUserPlaces")
        placesWithoutIndex.getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    print("hello")
                    print(querySnapshot!.documents)
                    for document in querySnapshot!.documents {
//                        print("\(document.documentID) => \(document.data())")
                        print("document \(document.documentID)")
                        
                        do {
//                            self.loadedPlace = try document.data() as TherePlace
//                            var placeData = try decoder.decode([TherePlace].self, from: document.data)
//                            try? document.data(as: TherePlace.self)
                        }
                        catch {
                            print(error)
                        }
                        
                        
                        
                    }
                }
        }
        
        
    }
    
    
    func savePlaceToCurrentUser(newPlace: [String: Any]) {
        
        var docId: String = "" // Document ID
        var numberOfPlaces: Int = 0 // Number of places in placesIndexRef
        let currentUserId = Auth.auth().currentUser // Current User ID
        let places = db.collection("users").document(currentUserId!.uid).collection("places") // Places Collection
        let fullrefplacesIndex = db.collection("users").document(currentUserId!.uid).collection("places").document("placesIndex")
      
        fullrefplacesIndex.getDocument { (document, error) in
            
//            while document == nil {}
                        
                if let document = document, document.exists {
                    
                    let dataDescription = document.data()
//                    let dataDescription = document.data().map(String.init(describing:))
//                    while dataDescription == nil {}
//                    print("placesIndex Document data: \(dataDescription ?? "nil")")
                    numberOfPlaces = dataDescription?.count ?? 0
                    print("numberOfPlaces: \(numberOfPlaces)")
                    setNewPlacetoDoc()
                } else {
                    print("places index Document does not exist")
                    fullrefplacesIndex.setData([:]) { err in
                        numberOfPlaces = 0
                        setNewPlacetoDoc()
                    }
                    
                }
            } // End full placesIndex creation submodule
        
        func setNewPlacetoDoc() {
            
            // This section saves document of the place to the collection, and gets the doc id.
            print("hello saveplacetocurrentuser")
                // create empty document
            let newDoc = places.document()
                // get the new document ID
            docId = newDoc.documentID
            print("docId \(docId)")
            
    //            // Set the newPlace to the new document
            newDoc.setData(newPlace) { err in
                if let err = err {
                    print("Error writing newPlace document: \(err)")
                }
                else {
                    print("New Place Document successfully written!")
                }
            }
   
            // Add newplace documentID to the placesIndex document
    
            print("docID \(docId)")
            print("numberofplaces \(numberOfPlaces)")
                fullrefplacesIndex.updateData([String(numberOfPlaces + 1): docId]) { err in
                    if let err = err {
                        print("Error updating placesIndex document: \(err)")
                    }
                    else {
                        print("newPlace DocumentID successfully updated to the placesIndex document")
                    }
                } // End updataData submethod
        
        } // end setNewPlaceToDoc
        
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


