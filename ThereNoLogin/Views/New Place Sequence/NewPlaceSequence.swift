//
//  NewPlaceSequence.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/7/21.
//

import SwiftUI

struct NewPlaceSequence: View {
    
    @EnvironmentObject var allPlaces: TherePlaceViewModel
    @State var newPlace = TherePlace()
    @State var hiddenArray = [false, true, true, true]
    @State private var backToBeenWant = false
    var body: some View {
    
        Group {
            if backToBeenWant {
                BeenWantView()
            } // End if
            else {
                // TODO Need to fix this line as its not working.... see line 35 comments as well: newPlace.privateSpot = true
                // Sections are in a ZStack, and each section would become hidden once it is complete
                ZStack {
                    
                    // Secion Want||Been, Private Y||N, Date, Name
                    VStack { // First Screen (hiddenArray[0])
                        Text("First Screen for new place data entry sequence")
                        Toggle("Want to go?", isOn: $newPlace.wantToGo)
                            .padding()
                        Toggle("Been here?", isOn: $newPlace.beenTo)
                            .padding()
                        Text(String(newPlace.beenTo))
                        // It wont let me use a toggle but it will let me use a picker, i think because it is an optional maybe the toggle creates the value differently to the picker? anyway wont compile
                        Toggle("Private Spot?", isOn: $newPlace.privateSpot)
                            .padding()
//                        Picker("Is this a private place?", selection: $newPlace.privateSpot) {
//                            Text("Yes").tag(false)
//                            Text("No").tag(true)
//                        }
                        
                        // TODO Date Picker defaulting with today
                        NewPlaceView() // Name
                        
                        HStack {
                            Image(systemName: "arrow.left.circle")
                                .font(.system(size: 76.0))
                                .onTapGesture {
                                    // TODO need to work out how to return to beenwantview, as getting error 'Partial application of mutating method is not allowed when i create an instance of that struct
                                }
                                    
                            Image(systemName: "arrow.right.circle")
                                .font(.system(size: 76.0))
                                .onTapGesture {
                                    hiddenArray[1] = false
                                    hiddenArray[0] = true
                                }
                            
                        } // End HStack
                        
                    } // End VStack
                    .isHidden(hiddenArray[0])
                    
                    // Address, Country Picker, State Picker
                    VStack { // Second Screen (hiddenArray[1])
                        Text("Second Screen for new place data entry sequence")
                        Picker("Choose a Country?", selection: $newPlace.placeCountry) { // default to current country or US
                            Text("USA").tag("USA")
                            Text("Australia").tag("Australia")
                        }
                        Text("it should come just below this")
                        Text(newPlace.placeCountry)
                        
                        Picker("Choose a State?", selection: $newPlace.placeState) { // default to current country or US
                            Text("Yes").tag(false)
                            Text("No").tag(true)
                        }
                        
                        NewPlaceView() // Address

                        HStack {
                            Image(systemName: "arrow.left.circle")
                                .font(.system(size: 76.0))
                                .onTapGesture {
                                    hiddenArray[0] = false
                                    hiddenArray[1] = true
                                }
                                    
                            Image(systemName: "arrow.right.circle")
                                .font(.system(size: 76.0))
                                .onTapGesture {
                                    hiddenArray[1] = true
                                    hiddenArray[2] = false
                                }
                            
                        } // End HStack
                        
                    } // End VStack
                    .isHidden(hiddenArray[1])
        //
        //            // Comment Public / Comment Private
                    VStack { // Third Screen (hiddenArray[2])
                        Text("Third and last Screen for new place data entry sequence")
                        NewPlaceView()
                        NewPlaceView()
                        HStack {
                            Image(systemName: "arrow.left.circle")
                                .font(.system(size: 76.0))
                                .onTapGesture {
                                    hiddenArray[1] = false
                                    hiddenArray[2] = true
                                }
                                    
                            Image(systemName: "arrow.right.circle")
                                .font(.system(size: 76.0))
                                .onTapGesture {
                                    allPlaces.placesArray.append(newPlace)
                                    
                                }
                            
                        } // End HStack
                    } // End VStack
                    .isHidden(hiddenArray[2])
                    
                } // End ZStack
                
            } // End Else
            
        } // End Group
        
    } // End body

    

    
} // End NewPlaceSequence struct




//struct NewPlaceSequence_Previews: PreviewProvider {
//    static var previews: some View {
//        NewPlaceSequence()
//    }
//}
