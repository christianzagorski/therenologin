//
//  buttontest.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/25/21.
//

import SwiftUI

struct TypeFilterBar: View {
    
    var type: String
    @EnvironmentObject var allPlaces: TherePlaceViewModel
    
    
    var body: some View {
    
        HStack {
            Button(action: {
                allPlaces.typeArrayFilter(typeFilter: type)
            }, label: {
                Text(type)
                    .padding()
                    .frame(maxHeight: .infinity)
                    .clipShape(Capsule())
                    .foregroundColor(Color.black)
            
            })
            
        } // End HStack
        .fixedSize(horizontal: false, vertical: true)
        .frame(maxHeight: 45)
        

    }
}

//struct buttontest_Previews: PreviewProvider {
//    static var previews: some View {
//        buttontest()
//    }
//}
