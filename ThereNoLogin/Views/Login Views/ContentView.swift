//
//  ContentView.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 6/5/21.
//

import Foundation
import SwiftUI
import FirebaseAuth

struct ContentView: View {
    
    
    
    @State private var firstname: String = ""
    @EnvironmentObject var allPlaces: TherePlaceViewModel
    @EnvironmentObject var currentUserAuth: LoginAuthViewModel
    
    var body: some View {
        
        VStack (spacing:20) {
            Text("Welcome!")
            
            Button {
                try! Auth.auth().signOut()
                currentUserAuth.loggedIn = false
            } label: {
                Text("Sign Out")
            }

        }
    }
    
    
}
