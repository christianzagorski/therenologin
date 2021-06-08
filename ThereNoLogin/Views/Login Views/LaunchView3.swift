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
    @State var logOrCreate = 0
    
    
    var body: some View {
        
             // TODO change from sheet to a tab view...
            
            // Check the logged in property and show the appropriate view
            
        Group {
            
        
        if !currentUserAuth.loggedIn {
                Group {
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
                }
                
            } // End If
            
            else {
                
                // Show logged in view
                BeenWantView()
            
            } // End Else
        
        } // End Group 1
        .onAppear {
            currentUserAuth.checkLogin()
            print("print at appear of Launch View: LOGGED IN? \(currentUserAuth.loggedIn)")
            
        }
    } // End Body
    
} // End Struct

struct LaunchView3_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView3()
    }
}
