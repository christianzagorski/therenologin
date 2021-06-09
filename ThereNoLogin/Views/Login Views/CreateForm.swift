//
//  CreateForm.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 6/5/21.
//

import Foundation
import SwiftUI
import FirebaseAuth
import Firebase

struct CreateForm: View {
    
    @EnvironmentObject var allPlaces: TherePlaceViewModel
    @EnvironmentObject var currentUserAuth: LoginAuthViewModel
    @EnvironmentObject var firebaseCall: FirebaseDataProcessor
    @Binding var loginShowing: Int
    @State var name = "empty"
    //@State private var email: String = ""
    //private var name: String = ""
    //@State private var password: String = ""
    
    @State private var errorMessage: String?
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section {
                    TextField("Email", text: $currentUserAuth.email)
                    TextField("Name", text: $name)
                    SecureField("Password", text: $currentUserAuth.password)
                }
                
                if errorMessage != nil {
                    Section {
                        Text(errorMessage!)
                    }
                }
                
                Button(action: {
                    
                    // Create account
                    currentUserAuth.createAccount()
                    firebaseCall.saveFirstName(name: name)
                    loginShowing = 0
                    
                }, label: {
                    HStack {
                        Spacer()
                        Text("Create Account")
                        Spacer()
                    }
                })
                Button(action: {
                    try! Auth.auth().signOut()
                    currentUserAuth.loggedIn = false
                    loginShowing = 0
                }, label: {
                    HStack {
                        Spacer()
                        Text("Cancel")
                        Spacer()
                    }
                })
            }
            .navigationBarTitle("Create an Account")
            
        }
        
    }
    
    
}
//
//struct CreateForm_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateForm()
//    }
//}
