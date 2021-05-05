//
//  File.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/4/21.
//

import Foundation

// Main place model that has all the properties for the place. Non exhaustive yet.

// TODO - some variables to be added: 'Collection', 'Gem' bool.....

// Obvs all the dates / times / location data is not here. API will provide this.

struct TherePlace: Identifiable, Codable {
    
    var id: UUID?
    var placeType: String?
    var placeTypeI: Int?
    var placeName: String = ""
    var placeAddress: String?
    var placeSuburb: String?
    var placeZip: Int?
    var placeState: String?
    var placeCountry: String?
    var placeCountryCode: Int?
    var latGPS: Float16?
    var lonGPS: Float16?
    var dateVisitedStart: Date?
    var dateVisitedEnd: Date?
    var timeVisitedStart: Date?
    var timeVisitedEnd: Date?
    var commentPublic: String?
    var commentPrivate: String?
    var imageName: String?
    var wantOrFav: Bool = true
    var privateSpot: Bool = false
    var whenAdded: Date?
    var whoAdded: String?
    
    

}

