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

// MARK - Properties Declaration

    @Published var loggedIn = true
    @Published var currentUserLoggedIn = User.self
    @Published var errorMessage: String?
    
// MARK - Initializer
    
    // Initializer checks to see if there is a user logged in.
    init() { loggedIn = Auth.auth().currentUser != nil ? true : false }
    
// MARK - Methods
    
    func checkLogin() {
        
        loggedIn = Auth.auth().currentUser != nil ? true : false
        
    } // End func checkLogin
    
    // signIn method is called when logging in. It passes email and password.
    func signIn(email: String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            guard error == nil else {
                self.errorMessage = error!.localizedDescription
                return
            }
        }
        
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                self.checkLogin()
            }
        }
        
    } // End signIn Function
    
    // createAccount method is called from the create account View. Note that the this view model only creates the account. A separate function is called to store other user data (name) in the firebase ViewModel
    func createAccount(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            DispatchQueue.main.async {
                if error == nil {
                    Auth.auth().addStateDidChangeListener { (auth, user) in
                        if user != nil {
                            self.checkLogin()
                        }
                    }
                }
                else {
                    self.errorMessage = error!.localizedDescription
                }
            }
            
        }
    } // End CreatAccount Method

} // End Class LoginAuthViewModel
