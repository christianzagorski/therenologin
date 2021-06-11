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
    @State var cityName: String = ""
    @State var countryName: String = ""
    @State var stateName: String = ""
    @State var typeName: String = ""
    
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
                    
                    NewPlaceTextView(frameType: "oneline", suggestionString: "Search (But temp place name", input: $newPlaceVM.aNewPlaceNoOptionals.placeName)
                    Spacer()
                    Spacer()
                    
                    Group {
                    
                        NewPlaceTextView(frameType: "oneline", suggestionString: "Type Temp Input", input: $newPlaceVM.aNewPlaceNoOptionals.placeType)
                        
                        NewPlaceTextView(frameType: "oneline", suggestionString: "City Temp Input", input: $newPlaceVM.aNewPlaceNoOptionals.placeSuburb)
                        
                        NewPlaceTextView(frameType: "oneline", suggestionString: "State Temp Input", input: $newPlaceVM.aNewPlaceNoOptionals.placeState)
                        
                        NewPlaceTextView(frameType: "oneline", suggestionString: "Country Temp Input", input: $newPlaceVM.aNewPlaceNoOptionals.placeCountry)
                        
                        
                    }
                    Spacer()
                    
                    PlaceCardInActiveSearchView()
//                    placeTypeToDisplay: $newPlaceVM.aNewPlaceNoOptionals.placeType, placeCountryToDisplay: $newPlaceVM.aNewPlaceNoOptionals.placeCountry, placeNameToDisplay: $newPlaceVM.aNewPlaceNoOptionals.placeName)


                        .onTapGesture {
                            goToConfigView = true
//                            newPlaceVM.commitOptionalToPlace(stringToCommit: typeName, stringPropertyToCommitTo: "placeType", intToCommit: nil, intPropertyToCommitTo: nil)
//                            newPlaceVM.commitOptionalToPlace(stringToCommit: cityName, stringPropertyToCommitTo: "placeSuburb", intToCommit: nil, intPropertyToCommitTo: nil)
//                            newPlaceVM.commitOptionalToPlace(stringToCommit: stateName, stringPropertyToCommitTo: "placeState", intToCommit: nil, intPropertyToCommitTo: nil)
//                            newPlaceVM.commitOptionalToPlace(stringToCommit: countryName, stringPropertyToCommitTo: "placeCountry", intToCommit: nil, intPropertyToCommitTo: nil)
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
