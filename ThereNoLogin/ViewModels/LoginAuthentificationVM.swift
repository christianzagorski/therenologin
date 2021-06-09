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

    @Published var loggedIn = true
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String?
    
    init() {}
    
    func checkLogin() {
        
        loggedIn = Auth.auth().currentUser != nil ? true : false
        
    } // End func checkLogin
    
    func signIn() {
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
//        DispatchQueue.main.async {
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
    
    func createAccount() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            DispatchQueue.main.async {
                if error == nil {
//                    self.createFormShowing = false
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
}
