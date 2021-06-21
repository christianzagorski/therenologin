//
//  APIPlace.swift
//  Pods
//
//  Created by Christian Zagorski on 6/17/21.
//

import Foundation

struct APIPlace: Identifiable {
        
        var id = UUID()
        var name: String
        var type: [String]
        var identifier: String
        var country: String?
        var city: String?
        var addresscomp: String?
    
} // End Struct
