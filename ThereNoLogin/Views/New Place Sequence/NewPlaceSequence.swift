//
//  NewPlaceSequence.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/7/21.
//

import SwiftUI

// a very message 'add place' sequence. Now have design input to build out. this view struct was created early, hence significant proportion of code will be redundant / need re writing. BUT essentially works.

// Optionals stumping me and app is crashing if the user does not enter anything into the textfields.

struct NewPlaceSequence: View {
    
    @EnvironmentObject var allPlaces: TherePlaceViewModel
    @State var thisNewPlace = NewPlaceViewModel()
    let firebaseDataStore = FirebaseDataProcessor()
    @State var hiddenArray = [false, true, true, true]
    @State private var backToBeenWant = false
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var image: Image?
    let types = ["Hike", "Camping Spot", "Bar", "Eatery", "Accomodation", "Other"]
    
    
    var body: some View {
        
        
        Group {
            if backToBeenWant {
                //BeenWantView()

            } // End if

            else {

                ZStack {

                    // Section 1 - Want||Been, Private Y||N, Date, Name
                    VStack { // First Screen (hiddenArray[0])
                        Group {
                            Text("What type of place is this?")
                            Picker("Types", selection: Binding($thisNewPlace.theNewPlace.placeType)!) {
                                ForEach(types, id: \.self) {
                                                            Text($0)
                                }

                            }
                            .pickerStyle(SegmentedPickerStyle())

                            Text("Enter a name for this place:")
                            NewPlaceView(typingVar: $thisNewPlace.theNewPlace.placeName, suggestion: "Try Yosemite National Park...")
                                .padding()
                            Text("Do you Want to go here or have you been here - or both?")
                                .padding()
                            Toggle("Want to go or Favorite?", isOn: $thisNewPlace.theNewPlace.wantOrFav)
                                .padding()
                            Text("Is this a private place not to be shared?")
                                .padding()
                            Toggle("Private Spot?", isOn: $thisNewPlace.theNewPlace.privateSpot)
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
                            Text("Enter some more information about \(thisNewPlace.theNewPlace.placeName)...")
                            Picker("Choose a Country:", selection: Binding($thisNewPlace.theNewPlace.placeCountry)!) { // default to current country or US
                                Text("USA").tag("USA")
                                Text("Australia").tag("Australia")
                            }
                            .pickerStyle(SegmentedPickerStyle())

                            Text("Choose a State:")
                            Picker("Choose a State:", selection: Binding($thisNewPlace.theNewPlace.placeState)!) { // default to current country or US
                                Text("California").tag("CA")
                                Text("North Carolina").tag("NC")
                                Text("Oregon").tag("OR")
                                
                            }
                            Text("What about an address...")
                               
                            NewPlaceView(typingVar: Binding($thisNewPlace.theNewPlace.placeAddress)!, suggestion: "Enter an address...")
                           
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
                        Text("Enter a comment that will be visible for all to see about this place...")
                           
                        NewPlaceView(typingVar: Binding($thisNewPlace.theNewPlace.commentPublic)!, suggestion: "Try 'Great for Kids'")
                        
                        
                        Text("And a private comments that only you will see about this place if you want...")
                        NewPlaceView(typingVar: Binding($thisNewPlace.theNewPlace.commentPrivate)!, suggestion: "The kids went skinny dipping in the rockpool'")
                        
                        ZStack {
                            Rectangle()
                            if image != nil {
                                image?
                                    .resizable()
                                    .scaledToFit()
                            } else {
                                Text("Tap to select a picture")
                                    .foregroundColor(.white)
                                    .font(.headline)
                            }
                           
                        }
                        .onTapGesture {
                            self.showingImagePicker = true
                        }
                        
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
                                savePlace()
                                } // end onTapGesture
        
                            Spacer()
                        } // End HStack
                    } // End VStack
                    .isHidden(hiddenArray[2])
                    .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                        ImagePicker(image: self.$inputImage)
                    }

                } // End ZStack
                
                
            } // End else for return to beenwantview

        } // End group for return to beenwantview
                
    } // End body

    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        return
    }
    
    func savePlace() {
        
//        print("imageName for new place is \(thisNewPlace.theNewPlace.imageName!)")
//        if thisNewPlace.theNewPlace.imageName == nil {
//            self.thisNewPlace.theNewPlace.imageName = "tarli"
//        }
        thisNewPlace.theNewPlace.id = UUID()
        thisNewPlace.theNewPlace.whenAdded = Date()	
        thisNewPlace.returnOptionals() // TODO This is still not working
        thisNewPlace.theNewPlace.imageName = "tarli"
        thisNewPlace.theNewPlace.placeSuburb = "Pootown"
        self.allPlaces.placesArray.append(thisNewPlace.theNewPlace)
        backToBeenWant.toggle()
        //firebaseDataStore.addNewPlace(newPlace: thisNewPlace.theNewPlace)
        print("Appended new place successfully")
        print("Total places in array is \(allPlaces.placesArray.count)")
    }
    
} // End NewPlaceSequence struct




//struct NewPlaceSequence_Previews: PreviewProvider {
//    static var previews: some View {
//        NewPlaceSequence()
//    }
//}
