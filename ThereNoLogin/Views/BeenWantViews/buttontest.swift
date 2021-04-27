//
//  buttontest.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/25/21.
//

import SwiftUI

struct buttontest: View {
    
    let type: String
    @State var setColor: Color = Color.black
    
    var body: some View {
    
        HStack {
            Button(action: {}, label: {
                Text(type)
                    .padding()
                    .frame(maxHeight: .infinity)
                    .background(setColor.opacity(0.1))
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
