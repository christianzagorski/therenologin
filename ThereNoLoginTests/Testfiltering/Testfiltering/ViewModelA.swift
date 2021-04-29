//
//  ViewModelA.swift
//  Testfiltering
//
//  Created by Christian Zagorski on 4/28/21.
//

import Foundation

import SwiftUI

class ViewModelA: ObservableObject {
    @Published var testArray = [DataObject]()
    @Published var filtArray = [DataObject]()
    @Published var testNum = "a"

    init() {
        
        var ob1 = DataObject()
        ob1.id = UUID()
        ob1.varstring = "String1"
        ob1.varStringFilt = "a"
        testArray.append(ob1)
        
        var ob2 = DataObject()
        ob2.id = UUID()
        ob2.varstring = "String2"
        ob2.varStringFilt = "b"
        testArray.append(ob2)
        
        var ob3 = DataObject()
        ob3.id = UUID()
        ob3.varstring = "String3"
        ob3.varStringFilt = "b"
        testArray.append(ob3)
        
        var ob4 = DataObject()
        ob4.id = UUID()
        ob4.varstring = "String4"
        ob4.varStringFilt = "c"
        testArray.append(ob4)
        
        filtArray = testArray
    }
    
    func filterArray (filterBy: String) {
        filtArray = testArray.filter {$0.varStringFilt == filterBy}
    }

}
