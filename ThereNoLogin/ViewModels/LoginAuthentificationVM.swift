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
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String?
    @Published var loginFormShowing = false
    @Published var createFormShowing = false
    @Published var firstName = ""
    
    init() {
        
    }
    
    func checkLogin() {
        
        print("print at commencement of checkLogin Method: LOGGED IN? \(loggedIn)")
        loggedIn = Auth.auth().currentUser != nil ? true : false
        print("print at complettion of checkLogin Method: LOGGED IN? \(loggedIn)")
        print("print at complettion of checkLogin Method: CURRENTUSER? \(String(describing: Auth.auth().currentUser))")
        
    
    } // End func checkLogin

    
    func takeCompleationHandler(compleationHandler:()->Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
//            DispatchQueue.main.async {
                    
                    guard error == nil else {
                        
                        self.errorMessage = error!.localizedDescription
                        return
                    }
                }
//            } // End dispatch main aysnc
        print("From the function Body")
        
        compleationHandler()
    }
    
    
    func listnerSignIn() {
    
        Auth.auth().addStateDidChangeListener { (auth, user) in
          // ...
            print ("Current user listner: \(String(describing: Auth.auth().currentUser))")
            print (auth)
            print (user ?? "nil")
            if user != nil {
                self.checkLogin()
                
            }
        
        }
    }
    
    
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
                    
                    // Save the first name
                    self.firstName = self.name
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





