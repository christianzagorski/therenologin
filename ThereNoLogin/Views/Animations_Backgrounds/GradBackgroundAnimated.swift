//
//  GradBackgroundAnimated.swift
//  There
//
//  Created by Christian Zagorski on 3/26/21.
//

import SwiftUI

// Currently not being actively used, but development came from design input at early stage of project. will likely use during loading screen and login sequence.

struct GradBackgroundAnimated: View {
    
    // Animation of Background Gradient parameters
    private let animation = Animation.easeInOut(duration: 5).repeatForever(autoreverses: false)
    
    // State Variables for controlling the animation of the gradient
    @State var gradient = [Color(red: (20/255), green: (103/255), blue: (103/255)), Color(red: (64/255), green: (156/255), blue: (241/255)), Color(red: (20/255), green: (103/255), blue: (103/255))]
    @State var startPoint = UnitPoint(x: 0, y: 0)
    @State var endPoint = UnitPoint(x: 1, y: 1)
    
    
    var body: some View {
        
        Rectangle()
            .fill(LinearGradient(gradient: Gradient(colors: self.gradient), startPoint: self.startPoint, endPoint: self.endPoint))
            .onAppear {
                withAnimation(self.animation, {
                    self.startPoint = UnitPoint(x: 1, y: 1)
                    self.endPoint = UnitPoint(x: 0, y: 0)
                })
            }
            .ignoresSafeArea()
        
        
    }
}

struct GradBackgroundAnimated_Previews: PreviewProvider {
    static var previews: some View {
        GradBackgroundAnimated()
    }
}
