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
                //LoadingView()
                
            } // End Else
        
        } // End Group 1
        .onAppear {
            currentUserAuth.checkLogin()
        }
    } // End Body
    
} // End Struct

struct LaunchView3_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView3()
    }
}
