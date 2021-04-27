//
//  TopMenuBar.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/25/21.
//

import SwiftUI

struct TopMenuBar: View {
    var body: some View {
        HStack {
            //Image("calea") // Add Image here for login credential photo
            Label {
                Text("Christian Zagorski")
                    .font(.body)
                    .foregroundColor(.primary)
               
            }
                
                icon: {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 44, height: 44, alignment: .center)
                        .overlay(Text("CZ"))
                }
            .padding(.leading)
            
            Spacer()
            Image(systemName: "square.grid.2x2")
                .padding(.trailing, 10)
            Image(systemName: "map")
                .padding(.trailing, 10)
        
        } // End HStack
        
    } // End Body
    
} // End Struct

struct TopMenuBar_Previews: PreviewProvider {
    static var previews: some View {
        TopMenuBar()
    }
}