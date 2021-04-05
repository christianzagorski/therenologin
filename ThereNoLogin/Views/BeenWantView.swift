//
//  BeenWantView.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/4/21.
//

import SwiftUI

struct BeenWantView: View {
    
    @EnvironmentObject var allPlaces: TherePlaceViewModel
    
    var body: some View {
        
        TabView {
            
            WantCardView()
                .tabItem {
                    
                    
                }
            
            BeenCardView()
                .tabItem {
                    
                    
                }
   
        } // End TabView
        
        
        
        
    } // End body
    
} // End BeenWantView structure

struct BeenWantView_Previews: PreviewProvider {
    static var previews: some View {
        BeenWantView()
            .environmentObject(TherePlaceViewModel())
    }
}
