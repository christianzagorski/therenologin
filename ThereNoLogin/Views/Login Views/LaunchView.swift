//
//  LaunchView.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 6/5/21.
//

import Foundation
import SwiftUI
import FirebaseAuth

struct LaunchView: View {
    
    @State var createFormShowing = false
    @EnvironmentObject var allPlaces: TherePlaceViewModel
    @EnvironmentObject var currentUserAuth: LoginAuthViewModel
    
    
    var body: some View {
            
        // Check the logged in property and show the appropriate view
        if !currentUserAuth.loggedIn {
        
            VStack (spacing: 20) {
                
                // Sign in button
                Button {
                    // Show the login form
                    currentUserAuth.loginFormShowing = true
                } label: {
                    Text("Sign In")
                }
                .sheet(isPresented: $currentUserAuth.loginFormShowing, onDismiss: currentUserAuth.checkLogin) {
                    LoginForm()
                }
                
                // Create account button
                Button {
                    currentUserAuth.createFormShowing = true
                } label: {
                    Text("Create Account")
                }
                .sheet(isPresented: $currentUserAuth.createFormShowing, onDismiss: currentUserAuth.checkLogin) {
                    CreateForm()
                }
                
            }
            .onAppear {
                currentUserAuth.checkLogin()
            }
        }
        else {
            
            // Show logged in view
            // Code from CWC template that takes logged in user to ContentView View
            ContentView()
            //BeenWantView(loggedIn: $loggedIn)
        }
    }
    
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
