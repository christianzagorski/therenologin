//
//  BeenWantView.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/4/21.
//

import SwiftUI

struct BeenWantView: View {
    var body: some View {
        
        TabView {
            
            GeometryReader { geo in
                
                NavigationView {
                    
                    ScrollView {
                        
                        LazyVStack {
                            
                            LazyHStack {
                                
                                if geo.size.width < 400 {
                                    // If screen width is small make two tiles horizontally
                                }
                                
                                else {
                                    // If screen width is large make four tiles horizontally
                                }
                                
                            } // End LazyHStack
                            
                        } // End LazyVStack
                        
                    } // End ScrollView
                    
                } // End Navigation View
                
            } // End GeometryReader
   
        } // End TabView
        
        
        
        
    } // End body
    
} // End BeenWantView structure

struct BeenWantView_Previews: PreviewProvider {
    static var previews: some View {
        BeenWantView()
    }
}
