//
//  SavePlaceToFirebase.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/26/21.
//

//  This Class handles all data queries and writes to Firestore but NOT Firebase Storage

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseStorage
import Combine
import FirebaseAuth
import FirebaseFirestoreSwift

class FirebaseDataProcessor: ObservableObject {
    
// MARK - Properties
    
    let storage = Storage.storage()
    let db = Firestore.firestore()
    @Published var currentUsername: String = ""
    @Published var loadingComplete = true // TODO - need to fix the loading pattern
    @Published var myImage = UIImage()
    
// MARK - Methods
    
    // TODO - When we get some user data to load
    func loadUserData() {}
    
    // Method is called when the BeenWantView is loaded, following a succesful auth check.
    func loadUserPlaces(userCompletionHandler: @escaping ([TherePlace]?, Error?) -> Void) {

        let currentUserId = Auth.auth().currentUser
        
        // Places Collection reference
        // Note method can only be called after a succesful Auth check, hence OK to unwrap currentUserId.
        let places = db.collection("users").document(currentUserId!.uid).collection("places")
        
        // whereField method is a filter, in this case if the document doesnt have a placeName property, it is not included. This is done in this instance to remove the placesIndex document.
        let placesWithoutIndex = places.whereField("placeName", isNotEqualTo: "")
        
        var placesArray = [TherePlace]()
        
        placesWithoutIndex.getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            }
            
            // If there is no error (err is nil) it saves each document as a 'TherePlace' object, appending it to an array.
            // Note that the TherePlace is codeable, meaning we can do this.
            else {
                for document in querySnapshot!.documents {
                    
                    let result = Result { try document.data(as: TherePlace.self) }
                       switch result {
                       case .success(let placeToSave):
                           if var placeToSave = placeToSave {
                            print("PlaceToSave here \(placeToSave.imageName)")
//                                placeToSave.imageName = "hawaiijump" // TODO fix with firebase Storage
                                placesArray.append(placeToSave)
                           }
                           
                           // A nil value was successfully initialized from the DocumentSnapshot, or snapshot was nil
                           else { print("Document does not exist") }
                       
                       case .failure(let error):
                           // A 'place' value could not be initialized from the DocumentSnapshot.
                           print("Error decoding city: \(error)")
                       } // end switch
                    
                } // End for loop cycle through documents
                userCompletionHandler(placesArray, nil)
            } // end else
        } // End get document firebase server call
        
    } // End func loadUserPlaces
    
    // Method is called when the user clicks the add new place button from the new place view sequece.
    func savePlaceToCurrentUser(newPlace: [String: Any]) {
        
        var docId: String = "" // Document ID
        var numberOfPlaces: Int = 0 // Number of places in placesIndexRef
        let currentUserId = Auth.auth().currentUser // Current User ID
        let placesRef = db.collection("users").document(currentUserId!.uid).collection("places") // Places Collection
        
        // placesIndex document is a dictionary map that has the doc id for each place document stored in the same collection.
        let placesIndexRef = db.collection("users").document(currentUserId!.uid).collection("places").document("placesIndex")
      
        placesIndexRef.getDocument { (document, error) in
                        
                if let document = document, document.exists { // Checks to make sure document exists
                    
                    let dataDescription = document.data()
                    numberOfPlaces = dataDescription?.count ?? 0 // counts the number of key / value pairs
                    setNewPlacetoDoc() // once we have the number of places we can call the sub function to save that new place
                
                } else {
                    print("places index Document does not exist")
                    placesIndexRef.setData([:]) { err in
                        numberOfPlaces = 0
                        setNewPlacetoDoc()
                    }
                    
                }
        } // End full placesIndex creation submodule
        
    func setNewPlacetoDoc() {  // Sub method
        
        // This section saves document of the place to the collection, and gets the doc id.
        let newDoc = placesRef.document()  // create empty document
            // get the new document ID
        docId = newDoc.documentID
        
        // Set the newPlace to the new document
        newDoc.setData(newPlace) { err in
            if let err = err { print("Error writing newPlace document: \(err)")}
            else { print("New Place Document successfully written!") }
        }

        // Add newplace documentID to the placesIndex document
        // TODO - remove placesIndex alltogether - dont need it its a server call that is not required
            placesIndexRef.updateData([String(numberOfPlaces + 1): docId]) { err in
                if let err = err { print("Error updating placesIndex document: \(err)") }
                else { print("newPlace DocumentID successfully updated to the placesIndex document") }
            } // End updataData submethod
    
        } // end setNewPlaceToDoc sub method
        
    } // End savePlaceToCurrentUser Method
    
    // TODO - move this into loadcurrentuser
    func getCurrentUsername() {
        
        let currentUserId = Auth.auth().currentUser
        let document = db.collection("users").document(currentUserId?.uid ?? "nil")
        
        document.getDocument { (docSnapshot, error) in
            if let error = error { print("error getting users name from firebase: \(error.localizedDescription)")}
            else if let docSnapshot = docSnapshot {
                if let userData = docSnapshot.data() { self.currentUsername = userData["name"] as! String }
                else { self.currentUsername = "nilname" }
        
            } else { print("error: no data returned from document call") } // No data returned
        
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
    func testMyFirebasePhotoJpg() {

        let storageRef = storage.reference()
        let imagesRef = storageRef.child("images")
        let imagefileRef = imagesRef.child("chowchilla.jpg")
        
        
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        imagefileRef.getData(maxSize: 1 * 1024 * 1024) { data1, error in
          if let error = error {
            print("an error occured \(error)")
            // Uh-oh, an error occurred!
          } else {
            // Data for "images/island.jpg" is returned
            let image = UIImage(data:data1!,scale:1.0)
            self.myImage = image!
          }
        }
        
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
    
    // TODO - initial thoughts around data flow for storage:
    
        // 1. after login, upon loading beenwant, or when a new place is added,

} // end FirebaseDataProcessor Class


