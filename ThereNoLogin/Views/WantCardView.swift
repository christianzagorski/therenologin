//
//  WantCardView.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/5/21.
//

import SwiftUI

struct WantCardView: View {
    
    @EnvironmentObject var allPlaces: TherePlaceViewModel
    
    var body: some View {
        
        
        GeometryReader { geo in
            
            NavigationView {
                
                ScrollView {
                    
                    LazyVStack {
                        
                        
                        ForEach(allPlaces.placesArray) {
                            
                            wantPlaces in
                            
                            NavigationLink(
                                destination: PlaceView(),
                                
                                label: {
                                    
                                    LazyHStack {
                                        
                                        if geo.size.width < 400 {
                                            // If screen width is small make two tiles horizontally
                                            Text("How's your mother?")
                                            
                                        } // End if
                                        
                                        else if geo.size.width < 800 {
                                            
                                            // If screen width is medium (landscape phone make three tiles horizontally
                                            
                                            Text("How's your sister?")
                                            // TODO Errors everywhere! arghh!
                                            Text(wantPlaces.placeType)
                                            
                                        } // End else if
                                        else {
                                            
                                            // If screen width is large make four tiles horizontally
                                            Text("How's your father?")
                                            
                                            
                                        } // End else
                                        
                                    } // End LazyHStack
                                    
                                } // End label for Navigation Link
                                
                            ) // End Argument list for Navigation Link
                            
                        } // End ForEach
                        
                    } // End LazyVStack
                    
                } // End ScrollView
                
            } // End Navigation View
            
        } // End GeometryReader

    } // End body

} // End struct

struct WantCardView_Previews: PreviewProvider {
    static var previews: some View {
        WantCardView()
    }
}
