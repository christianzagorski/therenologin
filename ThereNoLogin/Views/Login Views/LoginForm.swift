//
//  LoginForm.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 6/5/21.
//

import Foundation
import SwiftUI
import FirebaseAuth

struct LoginForm: View {
    
    @EnvironmentObject var allPlaces: TherePlaceViewModel
    @EnvironmentObject var currentUserAuth: LoginAuthViewModel
    @EnvironmentObject var firebaseCall: FirebaseDataProcessor
    @Binding var loginShowing: Int
    
    var body: some View {
        
        VStack {
            NavigationView {
                
                Form {
                    
                    Section {
                        TextField("Email", text: $currentUserAuth.email)
                        SecureField("Password", text: $currentUserAuth.password)
                        if currentUserAuth.errorMessage != nil {
                            Text(currentUserAuth.errorMessage!)
                        }
                    }
                    
                    Button(action: {
                        print("Login button pressed")
                        currentUserAuth.signIn()
                        
                        Auth.auth().addStateDidChangeListener { (auth, user) in
                            if user != nil {
                                firebaseCall.getCurrentUsername()
                                firebaseCall.loadUserPlaces(userCompletionHandler: {loadedUserPlaces, error in
                                    if let loadedUserPlaces = loadedUserPlaces {
                                        self.allPlaces.loadUserPlaces(firebaseLoadedPlaces: loadedUserPlaces)
                                        loginShowing = 0
                                    }
                                    
                                }) // end loadUserPlaces in firebaseCall
                            
                            }
                        }
                        
                        // TODO - Pull user data and places down here
                    }, label: {
                        HStack {
                            Spacer()
                            Text("Login")
                            Spacer()
                        }
                    })
                  
                    Button(action: {
                        print("cancel button pressed")
                        try! Auth.auth().signOut()
                        currentUserAuth.loggedIn = false
                        loginShowing = 0
                        // TODO - need to clear the values in the textfields after committing or cancelling
                        
                    }, label: {
                        HStack {
                            Spacer()
                            Text("Cancel")
                            Spacer()
                        }
                    }) // End Button
                
                }
                .navigationBarTitle("Login to Travel Gems")
            
            } // End Navigation View
        
        } // End VStack
    }
    
    func comp() {
    
    

    }
    
}

//struct LoginForm_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginForm()
//    }
//}
