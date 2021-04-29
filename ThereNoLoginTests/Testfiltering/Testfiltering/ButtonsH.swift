//
//  ButtonsH.swift
//  Testfiltering
//
//  Created by Christian Zagorski on 4/28/21.
//

import SwiftUI

struct ButtonsH: View {
    @EnvironmentObject var myViewModelInst: ViewModelA
    
        
    var body: some View {
        HStack {
            
            Button("Filter A") {
                myViewModelInst.testNum = "a"
                myViewModelInst.filtArray = myViewModelInst.testArray.filter {$0.varStringFilt == myViewModelInst.testNum}
                print("testNum = \(myViewModelInst.testNum)")
            }
            Button("Filter B") {
                myViewModelInst.testNum = "b"
                myViewModelInst.filtArray = myViewModelInst.testArray.filter {$0.varStringFilt == myViewModelInst.testNum}
                print("testNum = \(myViewModelInst.testNum)")
            }
            Button("Filter C") {
                myViewModelInst.testNum = "c"
                // myViewModelInst.filtArray = myViewModelInst.testArray.filter {$0.varStringFilt == myViewModelInst.testNum}
                myViewModelInst.filterArray(filterBy: "c")
                print("testNum = \(myViewModelInst.testNum)")
            }
        }
    }
}


//struct ButtonsH_Previews: PreviewProvider {
//    static var previews: some View {
//        ButtonsH()
//    }
//}
