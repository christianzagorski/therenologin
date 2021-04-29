//
//  SortMenusView.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/25/21.
//

import SwiftUI

// Views that allow two ways to filter the place array - 1st by recently added/country / nearby, and 2nd by place type.
struct SortMenusView: View {
    
    @State var sortStyleCode = 1
    @EnvironmentObject var allPlaces: TherePlaceViewModel
    var sortStyleOptions = ["Recently added", "By Country", "Nearby"]
    
    var body: some View {
        
        // TODO - will update this to be buttons, menu style was original design direction, but this changed.
        Menu {
            Button(action: {sortStyleCode = 0}) {
                Label(sortStyleOptions[0], systemImage: "doc")
            }

            Button(action: {sortStyleCode = 1}) {
                Label(sortStyleOptions[1], systemImage: "folder")
            }
            Button(action: {sortStyleCode = 2}) {
                Label(sortStyleOptions[2], systemImage: "folder")
            }

        } // End Menu

        label: {Label(sortStyleOptions[sortStyleCode], systemImage: "chevron.down")}
            .padding(.bottom)
            .padding(.leading)
            .foregroundColor(Color.black)
        
        // 2nd filter is capsule buttons which show a static array of place types, defined in a model.
        HStack {
            
            ScrollView(.horizontal) {
                
                HStack(spacing: 20) {
                
                    TypeFilterBar(type: "All")
                    
                    ForEach(allPlaces.placeTypes.placeTypes, id: \.self) {
                        
                        typetoshow in
                    
                        TypeFilterBar(type: typetoshow)
                    
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
