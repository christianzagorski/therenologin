//
//  File.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/4/21.
//

import Foundation


struct TherePlace: Identifiable, Decodable  {
    
    var id: UUID?
    var placeType: String
    var placeName: String
    var placeAddress: String?
    var placeState: String?
    var placeCountry: String
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
    var wantToGo: Bool
    var beenTo: Bool
    var privateSpot: Bool?

}

