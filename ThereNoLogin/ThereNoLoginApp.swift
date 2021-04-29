//
//  ThereNoLoginApp.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/4/21.
//

import SwiftUI
//import Firebase


@main
struct ThereNoLoginApp: App {
    @StateObject var allPlaces = TherePlaceViewModel()
    
//    init() {
//        FirebaseApp.configure()
//
//        saveToFB()
//    }
//
//    func saveToFB() {
//
//        // Reference to the cloud firestore database
//        let db = Firestore.firestore()
//
//        // Reference to the users collection
//        // Will be created if it doesnt already exist
//        let users = db.collection("users")
//
//        // Create a document with a given identifier
//        // users.document("test123").setData(["firstName":"Christian", "lastName":"Zagorski"])
//
//        // Create a document with unique idenifier
//        users.document() // no argument implies unique identifier
//            .setData(["firstName":"Christian", "lastName":"Zagorski"])
//
//        // Create a document with given data
//        // users.addDocument(data: ["firstName":"Christian", "lastName":"Zagorski"])
//
//
//    } // End Function saveToFB
    
    var body: some Scene {
        WindowGroup {
            BeenWantView()
                .environmentObject(allPlaces)
                .onAppear {
                    allPlaces.tabArrayFilter(whichTab: 1)
                }
            
        }
    }
}
