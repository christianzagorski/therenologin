//
//  LoginAuthentificationVM.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 5/6/21.
//

import Foundation
import FirebaseUI
import FirebaseAuth

class LoginAuthViewModel: ObservableObject {

    let firebaseDataStore = FirebaseDataProcessor()
    @Published var loggedIn = true
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String?
    @Published var loginFormShowing = false
    @Published var createFormShowing = false
    
    func checkLogin() {
        
        loggedIn = Auth.auth().currentUser == nil ? false : true
        print("LoggedIn variable in viewmodel: \(loggedIn)")
    
    } // End func checkLogin

    
    func signIn() {
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
            DispatchQueue.main.async {
                if error == nil {
                    
                    // Sign in successful
                    self.loginFormShowing = false
                    
                    // Dismiss this sheet
                }
                else {
                    // If there's an issue with logging in
                    self.errorMessage = error!.localizedDescription
        
                }
            }
        }
        
    } // End signIn Function
    

    func createAccount() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            DispatchQueue.main.async {
                if error == nil {
                    
                    // Save the first name
                    self.firebaseDataStore.saveFirstName(name: self.name)
                    self.createFormShowing = false
                    
                    // Dismiss the form
    
                }
                else {
                    self.errorMessage = error!.localizedDescription
                }
            }
            
        }
    } // End CreatAccount Method
}





