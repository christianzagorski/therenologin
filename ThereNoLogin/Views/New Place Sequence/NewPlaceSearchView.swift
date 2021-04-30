//
//  NewPlaceSearchView.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/29/21.
//

import SwiftUI

struct NewPlaceSearchView: View {
    @State var output: String = ""
    @State var input: String = ""
    @State var typing = false
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "chevron.left")
                    .padding(.leading)
                Spacer()
                Text("Add new place")
                Spacer()
            }
                
            TextField("", text: $input, onEditingChanged: {
                self.typing = $0
            }, onCommit: {
                self.output = self.input
            })

            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.black, lineWidth: 1)
            )
            .padding()
                

            
        
            Spacer()
            
            if !typing {
                if !output.isEmpty {
                    Text("You typed: \(output)")
                }
            } else if !input.isEmpty {
                Text("You are typing: \(input)")
            }
        }

    } // End body property

} // End struct NewPlaceSearchView

struct NewPlaceSearchView_Previews: PreviewProvider {
    static var previews: some View {
        NewPlaceSearchView()
    }
}
