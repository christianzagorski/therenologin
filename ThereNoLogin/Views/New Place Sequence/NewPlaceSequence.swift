//
//  NewPlaceSequence.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/7/21.
//

import SwiftUI

struct NewPlaceSequence: View {
    
    @EnvironmentObject var allPlaces: TherePlaceViewModel
    @State var thisNewPlace = TherePlace() // this is the easiest way to instantiate a local case of TherePlace.
    @State var hiddenArray = [false, true, true, true]
    @State private var backToBeenWant = false
    
    var body: some View {
        
        Group {
            if backToBeenWant {
                BeenWantView()
                
            } // End if
            
            else {

                ZStack {

                    // Section 1 - Want||Been, Private Y||N, Date, Name
                    VStack { // First Screen (hiddenArray[0])
                        Group {
//
//                            Text("Enter a name for this place:")
                            NewPlaceView(typingVar: $thisNewPlace.placeName, suggestion: "Try Yosemite National Park...")
                                .padding()
                            Text("Do you Want to go here or have you been here - or both?")
                                .padding()
                            Toggle("Want to go?", isOn: $thisNewPlace.wantToGo)
                                .padding()
                            Toggle("Been here?", isOn: $thisNewPlace.beenTo)
                                .padding()
                            Text("Is this a private place not to be shared?")
                                .padding()
                            Toggle("Private Spot?", isOn: $thisNewPlace.privateSpot)
                                .padding()
                            // TODO Date Picker defaulting with today
                        } // End first group
                        
                            // Buttons down the bottom
                        Group {
                            HStack {
                                Spacer()
                                Image(systemName: "arrow.left.circle")
                                    .font(.system(size: 60.0))
                                    .onTapGesture {
                                        
                                        // TODO need to work out how to return to beenwantview
                                    }
                                Spacer()
                                Image(systemName: "arrow.right.circle")
                                    .font(.system(size: 60.0))
                                    .onTapGesture {
                                        hiddenArray[1] = false
                                        hiddenArray[0] = true
                                    }
                                Spacer()

                            } // End HStack
                        } // End Group
                    } // End VStack
                    .isHidden(hiddenArray[0])

//                    // Address, Country Picker, State Picker
                    VStack { // Second Screen (hiddenArray[1])
                        Group {
                        Text("Enter some more information about \(thisNewPlace.placeName)...")
                            Picker("Choose a Country:", selection: $thisNewPlace.placeCountry) { // default to current country or US
                                Text("USA").tag("USA")
                                Text("Australia").tag("Australia")
                            }

                            Picker("Choose a State:", selection: $thisNewPlace.placeState) { // default to current country or US
                                Text("Yes").tag(false)
                                Text("No").tag(true)
                            }
                            Text("this is where the second instance of the newplaceview will go")
                           //NewPlaceView(typingVar: $thisNewPlace.placeAddress, suggestion: "Type an address...")
                        } // End Group
                        Group {
                            HStack {
                                Spacer()
                                Image(systemName: "arrow.left.circle")
                                    .font(.system(size: 60.0))
                                    .onTapGesture {
                                        hiddenArray[0] = false
                                        hiddenArray[1] = true
                                    }
                                Spacer()
                                Image(systemName: "arrow.right.circle")
                                    .font(.system(size: 60.0))
                                    .onTapGesture {
                                        hiddenArray[1] = true
                                        hiddenArray[2] = false
                                    }
                                Spacer()

                            } // End HStack
                        } // End Group 2
                    } // End VStack
                    .isHidden(hiddenArray[1])

                    // Comment Public / Comment Private
                    VStack { // Third Screen (hiddenArray[2])
                        Text("Enter some commentary about this location...")
                        
                        //NewPlaceView(typingVar: $thisNewPlace.commentPublic!, suggestion: "Add a public comment...")
                        let optionalC = optionalBindCheck()
                        Text(optionalC.checkMe(myOptional: thisNewPlace.commentPublic))
                        let passinString = optionalC.checkMe(myOptional: thisNewPlace.commentPublic)
                        NewPlaceView(typingVar: $passinString, suggestion: "Add a public comment...")
                        
                        //NewPlaceView(typingVar: $thisNewPlace.commentPrivate, suggestion: "Add a private comment...")
                        Spacer()
                        HStack {
                            Spacer()
                            Image(systemName: "arrow.left.circle")
                                .font(.system(size: 60.0))
                                .onTapGesture {
                                    hiddenArray[1] = false
                                    hiddenArray[2] = true
                                }
                            Spacer()
                            Image(systemName: "flag.circle")
                                .font(.system(size: 60.0))
                                .onTapGesture {
                                    thisNewPlace.id = UUID()
                                    self.allPlaces.placesArray.append(thisNewPlace)
                                    backToBeenWant.toggle()
                                    
                                        print("Appended")
                                        print(allPlaces.placesArray.count)
                                    } // end onTapGesture
        
                            Spacer()
                        } // End HStack
                    } // End VStack
                    .isHidden(hiddenArray[2])
//
                } // End ZStack
                
            } // End else for return to beenwantview
            
        } // End group for return to beenwantview
                
    } // End body

    

    
} // End NewPlaceSequence struct




//struct NewPlaceSequence_Previews: PreviewProvider {
//    static var previews: some View {
//        NewPlaceSequence()
//    }
//}
