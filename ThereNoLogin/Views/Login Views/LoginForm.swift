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
    
    var body: some View {
        
        VStack {
            NavigationView {
                
                Form {
                    
                    Section {
                        TextField("Email", text: $currentUserAuth.email)
                        SecureField("Password", text: $currentUserAuth.password)
                    }
                    
                    if currentUserAuth.errorMessage != nil {
                        Section {
                            Text(currentUserAuth.errorMessage!)
                        }
                    } // End if
                    
                    Button(action: {
                        
                        // Perform login
                        currentUserAuth.signIn()
                        
                    }, label: {
                        HStack {
                            Spacer()
                            Text("Sign in")
                            Spacer()
                        }
                    })
                    
                    Button(action: {
                        
                        // dismiss loginform sheet
                        currentUserAuth.loggedIn = false
                        currentUserAuth.loginFormShowing = false
                        
                    }, label: {
                        HStack {
                            Spacer()
                            Text("Cancel")
                            Spacer()
                        }
                    }) // End Button
                
                }
                .navigationBarTitle("Sign In")
            
            } // End Navigation View
        
        } // End VStack
    }
    
}

struct LoginForm_Previews: PreviewProvider {
    static var previews: some View {
        LoginForm()
    }
}
