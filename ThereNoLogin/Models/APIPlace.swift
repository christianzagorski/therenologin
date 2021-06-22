//
//  APIPlace.swift
//  Pods
//
//  Created by Christian Zagorski on 6/17/21.
//

import Foundation
import SwiftUI

struct APIPlace: Identifiable {
        
        var id = UUID()
        var name: String?
        var type: [String]?
        var identifier: String?
        var country: String?
        var city: String?
        var state: String?
        var addresscomp: String?
        var coordinates: [Double]?
        var formattedAddress: String?
        var photo: UIImage?
    
    
} // End Struct
