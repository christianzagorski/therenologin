//
//  NewPlaceSequence.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/7/21.
//

import SwiftUI

struct NewPlaceSequence: View {
    
    @EnvironmentObject var allPlaces: TherePlaceViewModel
    @EnvironmentObject var newPlace: NewPlaceViewModel
    
    @State var thisNewPlace = TherePlace()
    @State var hiddenArray = [false, true, true, true]
    @State private var backToBeenWant = false
    
    var body: some View {
    
       // newPlaceBinding = newPlace.aNewPlace
        VStack {
            var myNewPlace = newPlace.aNewPlace
        
            Text("Testing variable passing for placeName: \(newPlace.aNewPlace.placeName)")
//            Text("Testing variable created for placeName locally (state)" \(thisNewPlace.placeName)")"
//            Text("Testing variable passing for beenTo: \(myNewPlace.beenTo)")
//            Text("Testing variable passing for wantTo: \(myNewPlace.wantToGo)")

             Toggle("Want to go?", isOn: $thisNewPlace.wantToGo)
                 .padding()
            Text(String(thisNewPlace.wantToGo))
            Text(thisNewPlace.placeName)
//            Text(String(newPlace.aNewPlace.wantToGo))
//                .padding()
            Toggle(isOn: Binding(get: {
                myNewPlace.wantToGo
            }, set: { newVal in
                myNewPlace.wantToGo = newVal
                
            })) {
                Text(myNewPlace.wantToGo ? "Switch off" : "Switch on")
            }
            Text(String(myNewPlace.wantToGo))
                .onTapGesture {
               
                    self.allPlaces.placesArray.append(thisNewPlace)
                    print("Appended")
                    print(allPlaces.placesArray.count)
                }
            
            
            
//            Text("Enter a name for this place:")
//                                        NewPlaceView() // Name
//                                            .padding()
        }
        
//
//                ZStack {
//
//                    // Secion Want||Been, Private Y||N, Date, Name
//                    VStack { // First Screen (hiddenArray[0])
//                        Group {
//
//                            Text("Enter a name for this place:")
//                            NewPlaceView() // Name
//                                .padding()
//                            Text("Do you Want to go here or have you been here - or both?")
//                                .padding()
//                            Toggle("Want to go?", isOn: $myNewPlace.wantToGo)
//                                .padding()
//
//                            Toggle("Been here?", isOn: $myNewPlace.beenTo)
//                                .padding()
//                            Text(String(newPlace.beenTo))
//                            Text("Is this a private place not to be shared?")
//                                .padding()
//                            Toggle("Private Spot?", isOn: $myNewPlace.privateSpot)
//                                .padding()
//                        }
//
//                            // TODO Date Picker defaulting with today
//                            // Buttons down the bottom
//                        Spacer()
//                        Group {
//                            HStack {
//                                Spacer()
//                                Image(systemName: "arrow.left.circle")
//                                    .font(.system(size: 60.0))
//                                    .onTapGesture {
//                                        // TODO need to work out how to return to beenwantview, as getting error 'Partial application of mutating method is not allowed when i create an instance of that struct
//                                    }
//                                Spacer()
//                                Image(systemName: "arrow.right.circle")
//                                    .font(.system(size: 60.0))
//                                    .onTapGesture {
//                                        hiddenArray[1] = false
//                                        hiddenArray[0] = true
//                                    }
//                                Spacer()
//
//                            } // End HStack
//                        } // End Group
//                    } // End VStack
//
//                    .isHidden(hiddenArray[0])
//
//                    // Address, Country Picker, State Picker
//                    VStack { // Second Screen (hiddenArray[1])
//                        Text("Second Screen for new place data entry sequence")
//                        Text(String(newPlace.beenTo))
//                        Picker("Choose a Country?", selection: $myNewPlace.placeCountry) { // default to current country or US
//                            Text("USA").tag("USA")
//                            Text("Australia").tag("Australia")
//                        }
//                        Text("it should come just below this")
//                        Text(myNewPlace.placeCountry)
//
//                        Picker("Choose a State?", selection: $myNewPlace.placeState) { // default to current country or US
//                            Text("Yes").tag(false)
//                            Text("No").tag(true)
//                        }
//
//                        NewPlaceView() // Address
//                        Spacer()
//                        HStack {
//                            Spacer()
//                            Image(systemName: "arrow.left.circle")
//                                .font(.system(size: 60.0))
//                                .onTapGesture {
//                                    hiddenArray[0] = false
//                                    hiddenArray[1] = true
//                                }
//                            Spacer()
//                            Image(systemName: "arrow.right.circle")
//                                .font(.system(size: 60.0))
//                                .onTapGesture {
//                                    hiddenArray[1] = true
//                                    hiddenArray[2] = false
//                                }
//                            Spacer()
//
//                        } // End HStack
//
//                    } // End VStack
//                    .isHidden(hiddenArray[1])
//        //
//        //            // Comment Public / Comment Private
//                    VStack { // Third Screen (hiddenArray[2])
//                        Text("Third and last Screen for new place data entry sequence")
//                        NewPlaceView()
//                        NewPlaceView()
//                        Spacer()
//                        HStack {
//                            Spacer()
//                            Image(systemName: "arrow.left.circle")
//                                .font(.system(size: 60.0))
//                                .onTapGesture {
//                                    hiddenArray[1] = false
//                                    hiddenArray[2] = true
//                                }
//                            Spacer()
//                            Image(systemName: "flag.circle")
//                                .font(.system(size: 60.0))
//                                .onTapGesture {
//                                    Text(String(myNewPlace.placeName))
//                                    // allPlaces.placesArray.append(newPlace)
////                                    let lastTest = allPlaces.placesArray.count
////                                    Text(lastTest)
//                                } // end onTapGesture
//                            Spacer()
//                        } // End HStack
//                    } // End VStack
//                    .isHidden(hiddenArray[2])
//
//                } // End ZStack
//
    } // End body

    

    
} // End NewPlaceSequence struct




//struct NewPlaceSequence_Previews: PreviewProvider {
//    static var previews: some View {
//        NewPlaceSequence()
//    }
//}
