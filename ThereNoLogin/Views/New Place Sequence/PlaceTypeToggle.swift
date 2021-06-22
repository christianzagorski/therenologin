//
//  PlaceTypeToggle.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 6/9/21.
//

import SwiftUI

struct PlaceTypeToggle: View {
    
    @EnvironmentObject var newPlaceVM: NewPlaceViewModel

       var body: some View {
           VStack {
               Toggle("", isOn: $newPlaceVM.aNewPlaceNoOptionals.wantOrFav)
                   .toggleStyle(CheckmarkToggleStyle())
           }
       }
}

