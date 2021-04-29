//
//  ContentView.swift
//  Testfiltering
//
//  Created by Christian Zagorski on 4/28/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var myViewModelInst: ViewModelA
    
    
    var body: some View {
        
        VStack {
            
            
            ButtonsH()
            
            NavigationView {
                
                VStack {
                    
                    ForEach(myViewModelInst.filtArray, id: \.id) {
                            
                        objectS in
                        
                        NavigationLink(
                            destination: Text(myViewModelInst.testNum),
                            
                            label: {
                                
                                
                                Text("\(objectS.varstring) \(objectS.varStringFilt)")
                                
                            } // End label for Navigation Link
                            
                        ) // End Argument list for Navigation Link

                    } // End ForEach
                
                } // End VStack
            
            } // End NavView
        
        } // End VStack
        
        
    }
    
}


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
