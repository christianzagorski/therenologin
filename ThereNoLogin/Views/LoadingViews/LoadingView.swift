//
//  LoadingView.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 6/8/21.
//

import SwiftUI

struct LoadingView: View {
    
    @EnvironmentObject var firebaseCall: FirebaseDataProcessor
    
    var body: some View {
        ZStack {
            
            GeometryReader { geo in
                GradBackgroundAnimated()
                VStack(alignment: .center) {
                        Image("gem3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: (geo.size.width / 8), alignment: .center)
                    
                }
            } // End Geometry Reader
            
            
        } // End ZStack
        .onAppear {
            firebaseCall.loadUserData()
            firebaseCall.loadUserPlaces()
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
