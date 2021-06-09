//
//  PlaceTypeToggle.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 6/9/21.
//

import SwiftUI

struct PlaceTypeToggle: View {
    @State private var showGreeting = true

       var body: some View {
           VStack {
               Toggle("", isOn: $showGreeting)
                   .toggleStyle(CheckmarkToggleStyle())

               if showGreeting {
//                   Text("Hello World!")
               }
           }
       }
}

struct PlaceTypeToggle_Previews: PreviewProvider {
    static var previews: some View {
        PlaceTypeToggle()
    }
}
