//
//  ToggleConfig.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 6/9/21.
//

import Foundation
import SwiftUI

struct CheckmarkToggleStyle: ToggleStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        
        HStack {
            
            configuration.label
            Spacer()
            Rectangle()
                .foregroundColor(Color(red: (83/100), green: (83/100), blue: (83/100)))
                .frame(width: 350, height: 50, alignment: .center)
                .overlay(
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(width: 200, height: 50)
                        .cornerRadius(25)
                        .overlay(
                            (configuration.isOn ? (Text(Image(systemName: "heart")) + Text(" Favorite")) : (Text(Image(systemName: "bookmark")) + Text(" Want to go")))
                                .foregroundColor(.white)
                        )
                        .offset(x: configuration.isOn ? 100 : -100, y: 0)
                        .animation(Animation.linear(duration: 0.1))
    
                ).cornerRadius(25)
                .onTapGesture { configuration.isOn.toggle() }
            Spacer()
        }
    }
    
}
