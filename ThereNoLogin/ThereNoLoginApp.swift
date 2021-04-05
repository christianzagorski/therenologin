//
//  ThereNoLoginApp.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/4/21.
//

import SwiftUI

@main
struct ThereNoLoginApp: App {
    var body: some Scene {
        WindowGroup {
            BeenWantView()
                .environmentObject(TherePlaceViewModel())
        }
    }
}
