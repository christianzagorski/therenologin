//
//  TestfilteringApp.swift
//  Testfiltering
//
//  Created by Christian Zagorski on 4/28/21.
//

import SwiftUI

@main
struct TestfilteringApp: App {
    
    @StateObject var myViewModelInst = ViewModelA()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(myViewModelInst)
        }
    }
}
