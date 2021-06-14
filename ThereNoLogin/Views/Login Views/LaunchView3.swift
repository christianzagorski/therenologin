//
//  LaunchView3.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 6/6/21.
//

import SwiftUI

struct LaunchView3: View {
    
    @State var createFormShowing = false
    @EnvironmentObject var allPlaces: TherePlaceViewModel
    @EnvironmentObject var currentUserAuth: LoginAuthViewModel
    @EnvironmentObject var firebaseCall: FirebaseDataProcessor
    @State var logOrCreate = 0
    
    
    var body: some View {
            
        Group { // Group 1
        
        if !currentUserAuth.loggedIn {
                Group { //Group 2
                    switch logOrCreate {
                    case 1: LoginForm(loginShowing: $logOrCreate)
                    case 2: CreateForm(loginShowing: $logOrCreate)
                    default:
                        Button {
                            logOrCreate.self = 1
                        } label: {
                            Text("Login")
                        }
                        Button {
                            logOrCreate.self = 2
                        } label: {
                            Text("Sign up")
                        }
                    
                    } // End Switch
                } // End Group 2
                
            } // End If
            
            else {
                BeenWantView()
                    .onAppear {
                        firebaseCall.loadUserPlaces(userCompletionHandler: {loadedUserPlaces, error in
                            if let loadedUserPlaces = loadedUserPlaces {
                                print("user first name is : \(loadedUserPlaces[0].placeName)")
                                self.allPlaces.loadUserPlaces(firebaseLoadedPlaces: loadedUserPlaces)
                                print("loadedUserPlaces")
                                print(loadedUserPlaces)
                                
                                print("places array in VM:")
                                print(allPlaces.placesArray)
                                
                                
                            }
                            
                        }) // end loadUserPlaces in firebaseCall
                    }
                //LoadingView()
                
            } // End Else
        
        } // End Group 1
        .onAppear {
            firebaseCall.getCurrentUsername()
            currentUserAuth.checkLogin()
        }
    } // End Body
    
} // End Struct

struct LaunchView3_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView3()
    }
}
