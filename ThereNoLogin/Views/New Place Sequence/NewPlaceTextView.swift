//
//  NewPlaceSearchView.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/29/21.
//

import SwiftUI

struct NewPlaceTextView: View {
    var frameType: String = "oneline"
    var suggestionString: String
    @State var output: String = ""
    @State var input: String = ""
    @State var typing = false
    
    var body: some View {
        VStack {
                
            TextField(suggestionString, text: $input, onEditingChanged: {
                self.typing = $0
            }, onCommit: {
                self.output = self.input
            })

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
                    //Text("You typed: \(output)")
                }
            } else if !input.isEmpty {
                //Text("You are typing: \(input)")
            }
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

struct NewPlaceTextView_Previews: PreviewProvider {
    static var previews: some View {
        NewPlaceSearchView()
    }
}
