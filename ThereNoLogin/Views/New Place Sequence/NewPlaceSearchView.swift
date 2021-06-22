//
//  NewPlaceSearchView1.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/30/21.
//

import SwiftUI

struct NewPlaceSearchView: View {
    
    
    @EnvironmentObject var newPlaceVM: NewPlaceViewModel
    @EnvironmentObject var placesAPICall: GooglePlacesManager
    @State var searchString: String = ""
    @State var myreturnedPlacesArray: [APIPlace] = []
    
    var body: some View {
        
        Group {
            if newPlaceVM.goToConfigView { NewPlaceConfigurationView() }
            
            else {
                VStack {
                    HStack {
                        Image(systemName: "chevron.left")
                            .onTapGesture { newPlaceVM.showNewPlace = false }
                            .padding(.leading)
                        Spacer()
                        Text("Add new place")
                        Spacer()
                    }
                    
                    NewPlaceTextView(frameType: "oneline", suggestionString: "Search for a place...", input: $searchString)
                        .onChange(of: searchString) { newValue in
                            placesAPICall.findPlaces(query: searchString, completion: { result in
                                switch result {
                                    case .success(let returnedPlacesArray): myreturnedPlacesArray = returnedPlacesArray
                                    case .failure(let error): print(error.localizedDescription)
                                }
                            }) // End completion handler for findPlaces method
                        }
                    DynamicSearchResultsTable()
                    Spacer()
                    
                    PlaceCardInActiveSearchView()
                        .onTapGesture { newPlaceVM.goToConfigView = true }
                    
                    Spacer()
                    
                } // End Vstack
            
            } // End else
        
        } // End Group

    } // End Body

} // End struct


