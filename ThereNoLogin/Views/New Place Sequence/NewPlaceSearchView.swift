//
//  NewPlaceSearchView1.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/30/21.
//

import SwiftUI

struct NewPlaceSearchView: View {
    @State private var goToConfigView = false
    
    var body: some View {
        
        Group { // Using group view to instantiate the NewPlaceSequence when the button is pressed (state value updates)
            if goToConfigView {
                
                NewPlaceConfigurationView()
                
            } // End if
            
            else {
                VStack {
                    HStack {
                        Image(systemName: "chevron.left")
                            .padding(.leading)
                        Spacer()
                        Text("Add new place")
                        Spacer()
                    }
                    
                    NewPlaceTextView(frameType: "oneline", suggestionString: "Search")
                    
                    PlaceCardInActiveSearchView()
                        .onTapGesture {
                            goToConfigView = true
                        }
                    
                    Spacer()
                } // End Vstack
            
            } // End else
        
        } // End Group

    } // End Body

} // End struct

struct NewPlaceSearchView1_Previews: PreviewProvider {
    static var previews: some View {
        NewPlaceSearchView()
    }
}
