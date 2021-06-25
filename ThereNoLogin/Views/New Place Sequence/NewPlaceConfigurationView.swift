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
    @EnvironmentObject var allPlaces: TherePlaceViewModel
    @EnvironmentObject var placesAPICall: GooglePlacesManager
    @State var privateTab: Bool = true
    @State var commentPublic: String = ""
    @State var commentPrivate: String = ""
    @State var placeTypeNonOptional: String = ""
    
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
                PlaceCardInActiveSearchView(name: placesAPICall.apiPlaceToBeSaved.name!, country: placesAPICall.apiPlaceToBeSaved.country!)

                
                VStack {
                    Text("Some suggestions for the type of place to save:")
                    HStack {
                        ForEach(placesAPICall.apiPlaceToBeSaved.type!, id: \.self) { type in
                            Text(type)
                                .onTapGesture {
                                    newPlaceVM.aNewPlace.placeType = String(type)
                                    print(newPlaceVM.aNewPlace.placeType)
                                }
                        } // End ForEach
                        
                    } // End HStack
                    NewPlaceTextView(frameType: "oneline", suggestionString: "Or... Type your own", input: $placeTypeNonOptional)
                }
                
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
                
                HStack {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 20.0))
                        .foregroundColor(Color.black)
                    Text("Recommended by")
                }
                .padding(.leading)
                
            } // End Group 2
            
            Group { // Group 3
                Text("Comments or tips").padding(.leading)
                NewPlaceTextView(frameType: "multi", suggestionString: "Best Mararitas on the planet", input: $newPlaceVM.aNewPlaceNoOptionals.commentPublic)
                Text("Private notes").padding(.leading)
                NewPlaceTextView(frameType: "multi", suggestionString: "Notes for your eyes only.", input: $newPlaceVM.aNewPlaceNoOptionals.commentPrivate)
                
                HStack {
                    Toggle("Keep Private?", isOn: $newPlaceVM.aNewPlaceNoOptionals.privateSpot)
//                        .padding()
                } // End HStack for private toggle
                
                ZStack {
                    Rectangle()
                        .foregroundColor(Color.purple)
                        .frame(height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .cornerRadius(20)
                    
                    Text("Add new place")
                        .foregroundColor(Color.white)
                }
//                .padding()
                .onTapGesture {
                    
                    //  Adds the photo from the APIdetailsCall to firebase storage, and saves the file name to the TherePlace object
                    PhotoService.savePhoto(image: placesAPICall.placePhoto, userCompletionHandler: {filename, error in
                        if let filename = filename {
                            self.newPlaceVM.aNewPlace.imageName = filename
                            // Converts aNewPlaceNoOptionals to an instance of TherePlace (which has optionals) - needed to do this because of the optional binding issue
                            newPlaceVM.returnNoOptionals()
                            //
                            if newPlaceVM.aNewPlace.placeType == nil { newPlaceVM.aNewPlace.placeType = placeTypeNonOptional }
                            
                            // TODO - call a function (not yet created, not sure where it will be defined) that maps the APIPlace Object to the aNewPlace Instance (the one with optionals) of the NewPlaceViewModel (newPlaceVM)
                            
                            // Perhaps it passes in the aNewPlace instance to the APIVM? and returns it?
                            newPlaceVM.aNewPlace = placesAPICall.saveAPICallPropsToNewPlace(newPlace: newPlaceVM.aNewPlace)
                            
                            // Saves aNewPlace (of type TherePlace) to the current users firebase profile, but first converts it to a dictionary format.
                            firebaseCall.savePlaceToCurrentUser(newPlace: newPlaceVM.testDictionaryExtension()) // TODO Add completion handler here
                            
                            // Converts the current users firebase places from a Dictionary to a TherePlace object and then loads it into memory. Then a completion handler loads that object into the TherePlaceViewModel as the TherePlae object that is filtered and used in the HomeContentView.
                            firebaseCall.loadUserPlaces(userCompletionHandler: { loadedUserPlaces, error in
                                if let loadedUserPlaces = loadedUserPlaces {
                                    self.allPlaces.loadUserPlaces(firebaseLoadedPlaces: loadedUserPlaces)
                                }
                                
                            // Toggles ConfigView and NewPlaceSearchView to false, taking the user back to HomeContentView
                            newPlaceVM.goToConfigView = false
                            newPlaceVM.showNewPlace = false
                            
                                
                            }) // end loadUserPlaces in firebaseCall
                            
                            
                        }
                        
                    })
                   
                    // TODO clear values from aNewPlace
                } // end onTapGesture
                
            } // End Group 3
            
        } // End VStack
        
    } // End body property

} // End struct

//struct NewPlaceConfigurationView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewPlaceConfigurationView(privateTab: true)
//    }
//}

