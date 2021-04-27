//
//  SortMenusView.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/25/21.
//

import SwiftUI

struct SortMenusView: View {
    
    @State var sortStyleCode = 1
    var sortStyleOptions = ["Recently added", "By Country", "Nearby"]
    let types = ["Hike", "Camping Spot", "Bar", "Eatery", "Accomodation", "Other"]
    @State var placeTypeCode = 0
    
    var body: some View {
        
        Menu {
            Button(action: {
                sortStyleCode = 0
            }) {
                Label(sortStyleOptions[0], systemImage: "doc")
            }

            Button(action: {
                sortStyleCode = 1
            }) {
                Label(sortStyleOptions[1], systemImage: "folder")
            }
            Button(action: {
                sortStyleCode = 2
            }) {
                Label(sortStyleOptions[2], systemImage: "folder")
            }
        
        } // End Menu

        label: {
            Label(sortStyleOptions[sortStyleCode], systemImage: "chevron.down")
        }
            .padding(.bottom)
            .padding(.leading)
            .foregroundColor(Color.black)
        
        HStack {
            
            buttontest(type: "All", setColor: Color.purple)
            
            ScrollView(.horizontal) {
                
                HStack(spacing: 20) {
                    
                    ForEach(types, id: \.self) {
                        
                        typestoshow in
                    
                        buttontest(type: typestoshow, setColor: Color.black)
                    
                    } // End ForEach
                    
                } // End HStack
                
            } // End ScrollView horizontal
            
        } // End HStack
        
    } // End body
    
} // End Struct

struct SortMenusView_Previews: PreviewProvider {
    static var previews: some View {
        SortMenusView()
    }
}
