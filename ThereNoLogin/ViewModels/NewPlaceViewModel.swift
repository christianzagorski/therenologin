//
//  NewPlaceViewModel.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/9/21.
//

import Foundation

struct optionalBindCheck {
    
    
    
    func checkMe(myOptional: String?) -> String {
        var optionalCheck = myOptional
        
        if optionalCheck == nil {
            optionalCheck = "yayyyyy"
            let nonOptionalReturn: String = optionalCheck!
        return nonOptionalReturn
        }
        else {
        
        let nonOptionalReturn: String = optionalCheck!
        return nonOptionalReturn
        }
        
        
    }


}

