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
                        
                        currentUserAuth.signIn()
                
                    }, label: {
                        HStack {
                            Spacer()
                            Text("Login")
                            Spacer()
                        }
                    })
                  
                    Button(action: {
                        
                        // dismiss loginform sheet
                        try! Auth.auth().signOut()
                        currentUserAuth.loggedIn = false
                        loginShowing = 0
                        
                        
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
    
    
//    firebaseCall.getCurrentUsername()
    }
    
}

//struct LoginForm_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginForm()
//    }
//}
