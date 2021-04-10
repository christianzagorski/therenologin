//
//  PlaceView.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/4/21.
//

import SwiftUI
// This is the full screen view where the detail on the place is shown. It has a large image as a pinned header. When scroll down, all information about the place is shown. from this screen you can share the place with a friend, remove from want or been list, edit the place information, delete the place alltogether, etc.

struct PlaceView: View {
    
    var place: TherePlace
    @EnvironmentObject var allPlaces: TherePlaceViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

//struct PlaceView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlaceView()
//            .environmentObject(TherePlaceViewModel())
//    }
//}
