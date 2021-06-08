
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


@main
struct ThereNoLoginApp: App {
    
    @StateObject var allPlaces = TherePlaceViewModel()
    @StateObject var firebaseCall = FirebaseDataProcessor()
    @StateObject var currentUserAuth = LoginAuthViewModel()
    
    
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
            
        }
    }
}
