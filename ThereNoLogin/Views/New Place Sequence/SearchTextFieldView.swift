//
//  SearchTextFieldView.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 6/17/21.
//

import SwiftUI

struct NewPlaceSearchTextView: View {
    
    @EnvironmentObject var placesAPICall: GooglePlacesManager
    var frameType: String = "oneline"
    var suggestionString: String
    @State var output: String = ""
    @Binding var input: String
//    @State var input: String = ""
    @State var typing = false
    @State var output2: String = "this is also some text"
//    @Binding var textOutput: String
    @State var myreturnedPlacesArray: [Place] = []
    
    var body: some View {
        VStack {
                
            TextField(suggestionString, text: $input, onEditingChanged: {
                self.typing = $0
                
                
            }, onCommit: {
                self.output = self.input
                
                
                
            }) // End trailing closure for Texfield
            .onChange(of: input) { newValue in
//                print("Name changed to \(input)")
                placesAPICall.findPlaces(query: input, completion: { result in
                    switch result {
                        case .success(let returnedPlacesArray):
                            print(returnedPlacesArray[0].name)
                            print(returnedPlacesArray[0].type)
                           myreturnedPlacesArray = returnedPlacesArray
                        case .failure(let error):
                            print(error.localizedDescription)
                    }
                }) // End completion handler for findPlaces method
            }

            .padding()
            .frame(height: textFieldSize(frameType: frameType))
            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.black.opacity(0.5), lineWidth: 1)
            )
            .padding()
            
            
            if !typing {
                if !output.isEmpty {
                    Text("You typed: \(output)")
                }
            } else if !input.isEmpty {
                Text("You are typing: \(input)")
            }

            // TODO need to work out best approach for multiline because of swiftui contraints
            //            TextEditor(text: $output2)
//                        .foregroundColor(.secondary)
        }

    } // End body property
    
//    TextField(suggestion, text: $typingVar, onEditingChanged: { (changed) in
//                    print("Place Name onEditingChanged - \(changed)")
//                }) {
//                    print("Place Name onCommit")
//                }

    func textFieldSize(frameType: String) -> CGFloat {
        let textHeight: Float
        
        switch frameType {
        case "oneline": textHeight = 40.0
        case "multi": textHeight = 120.0
        default: textHeight = 40.0
        } // End Switch/Case
                        
        let textHeightCGFloat = CGFloat(textHeight)
        return textHeightCGFloat
    }
    
} // End struct NewPlaceSearchView


