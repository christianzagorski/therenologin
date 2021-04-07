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
            
            CardsGridView(beenOrWant: "want")
                .tabItem {
                    Image(systemName: "lock.rectangle.fill")
                    Text("Want to go there")
                    
                }
            
            CardsGridView(beenOrWant: "been")
                .tabItem {
                    Image(systemName: "lock.rectangle.fill")
                    Text("Been there")
                    
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
