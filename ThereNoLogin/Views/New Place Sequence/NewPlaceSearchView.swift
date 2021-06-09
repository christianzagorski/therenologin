//
//  NewPlaceSearchView1.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/30/21.
//

import SwiftUI

struct NewPlaceSearchView: View {
    
    
    @EnvironmentObject var newPlaceVM: NewPlaceViewModel
    @State private var goToConfigView = false
    @Binding var showNewPlace: Bool
    @State var placeName: String = ""
    
    var body: some View {
        
        Group {
            if goToConfigView {
                
                NewPlaceConfigurationView(goToConfigView: $goToConfigView)
                
            } // End if
            
            else {
                VStack {
                    HStack {
                        
                        Button(action: {
                            showNewPlace = false

                        }, label: {
                            Image(systemName: "chevron.left")
                                .padding(.leading)
                            })
                        
                        Spacer()
                        Text("Add new place")
                        Spacer()
                    }
                    
                    NewPlaceTextView(frameType: "oneline", suggestionString: "Search", output: $newPlaceVM.aNewPlace.placeName)
                    
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

//struct NewPlaceSearchView1_Previews: PreviewProvider {
//    static var previews: some View {
//        NewPlaceSearchView(false)
//    }
//}
