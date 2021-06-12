//
//  NewPlaceConfigurationView.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/29/21.
//

import SwiftUI

struct NewPlaceConfigurationView: View {
    
    @EnvironmentObject var firebaseCall: FirebaseDataProcessor
    @EnvironmentObject var newPlaceVM: NewPlaceViewModel
    @State var privateTab: Bool = true
    @State var commentPublic: String = ""
    @State var commentPrivate: String = ""
//    @Binding var goToConfigView: Bool
    
    var body: some View {
        
        VStack (alignment: .leading) {
            Group { // Group 1
                HStack {
                    Button(action: {
                        newPlaceVM.goToConfigView = false

                    }, label: {
                        Image(systemName: "chevron.left")
                            .padding(.leading)
                        })
                    
                    Spacer()
                    Text("Add new place")
                    Spacer()
                
                } // End HStack
                    .padding(.bottom)
            } // End group 1
            
            Group { // Group 2
                PlaceCardInActiveSearchView()
//                placeTypeToDisplay: $newPlaceVM.aNewPlaceNoOptionals.placeType, placeCountryToDisplay: $newPlaceVM.aNewPlaceNoOptionals.placeCountry, placeNameToDisplay: $newPlaceVM.aNewPlaceNoOptionals.placeName)
                
                Spacer()
                HStack {
                    Spacer()
                    PlaceTypeToggle()
                    Spacer()
                }
                HStack {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 20.0))
                        .foregroundColor(Color.black)
                    Text("Add to collection")
                }
                .padding(.leading)
                Spacer()
                HStack {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 20.0))
                        .foregroundColor(Color.black)
                    Text("Recommended by")
                }
                .padding(.leading)
                Spacer()
            } // End Group 2
            
            Group { // Group 3
                Text("Comments or tips").padding(.leading)
                NewPlaceTextView(frameType: "multi", suggestionString: "Best Mararitas on the planet", input: $newPlaceVM.aNewPlaceNoOptionals.commentPublic)
                Text("Private notes").padding(.leading)
                NewPlaceTextView(frameType: "multi", suggestionString: "Notes for your eyes only.", input: $newPlaceVM.aNewPlaceNoOptionals.commentPrivate)
                Spacer()
                HStack {
                    Toggle("Keep Private?", isOn: $newPlaceVM.aNewPlaceNoOptionals.privateSpot)
                        // $newPlaceVM.aNewPlaceNoOptionals.wantOrFav
                        .padding()
                } // End HStack for private toggle
                Spacer()
                ZStack {
                    Rectangle()
                        .foregroundColor(Color.purple)
                        .frame(height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .cornerRadius(20)
                    
                    Text("Add new place")
                        .foregroundColor(Color.white)
                }
                .padding()
                .onTapGesture {
                    
                    newPlaceVM.returnNoOptionals()
                    firebaseCall.savePlaceToCurrentUser(newPlace: newPlaceVM.testDictionaryExtension())
                    newPlaceVM.goToConfigView = false
                    newPlaceVM.showNewPlace = false
                    // TODO navigate back to beenwantview
                    // TODO clear values from aNewPlace
//                    firebaseCall.savePlaceToCurrentUser(newPlace: newPlaceVM.convertObjectToDictionary())
                }
                
            } // End Group 3
            
        } // End VStack
        
    } // End body property

} // End struct

//struct NewPlaceConfigurationView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewPlaceConfigurationView(privateTab: true)
//    }
//}

