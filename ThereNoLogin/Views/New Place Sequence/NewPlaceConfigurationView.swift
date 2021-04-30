//
//  NewPlaceConfigurationView.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/29/21.
//

import SwiftUI

struct NewPlaceConfigurationView: View {
    var body: some View {
        
        VStack (alignment: .leading) {
            
            HStack {
                Image(systemName: "chevron.left")
                    .padding(.leading)
                Spacer()
                Text("Add new place")
                Spacer()
            
            } // End HStack
                .padding(.bottom)
            
            HStack {
                Spacer()
                VStack (alignment: .leading) {
                    Text("Placename")
                        .font(Font.title2.weight(.bold))
                        .padding(.bottom, 5)
                    Text("Placesubtext with a litte more")
                        .font(Font.headline.weight(.light))
                }
                Spacer()
                Image("sealers")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .cornerRadius(10.0)
                    .padding(.leading)
                    
                Spacer()
            }
            Spacer()
        } // End VStack
        
    } // End body property

} // End struct

struct NewPlaceConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        NewPlaceConfigurationView()
    }
}
