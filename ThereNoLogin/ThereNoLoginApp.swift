
// Google places API Key: AIzaSyCltrn6xUfNf6StY7EgjWUeslcWJ9S84lg
//
//  ThereNoLoginApp.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/4/21.
//

import SwiftUI
import Foundation
import Firebase
import Combine
import GooglePlaces


@main
struct ThereNoLoginApp: App {
    
    @StateObject var allPlaces = TherePlaceViewModel()
    @StateObject var firebaseCall = FirebaseDataProcessor()
    @StateObject var currentUserAuth = LoginAuthViewModel()
    @StateObject var newPlaceVM = NewPlaceViewModel()
    @StateObject var placesAPICall = GooglePlacesManager()
    let key = GMSPlacesClient.provideAPIKey("AIzaSyCJIUR-VTJ2RNJtyFLiI2EfeIMgct5HH6Y") // AIzaSyCJIUR-VTJ2RNJtyFLiI2EfeIMgct5HH6Y - real key for travel gems
    
    
    init () {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LaunchView3()
                //BeenWantView()
                    .environmentObject(allPlaces)
                    .environmentObject(currentUserAuth)
                    .environmentObject(firebaseCall)
                    .environmentObject(newPlaceVM)
                    .environmentObject(placesAPICall)
            
        }
    }
}
