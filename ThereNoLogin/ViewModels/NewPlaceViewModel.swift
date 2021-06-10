//
//  NewPlaceViewModel.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/9/21.
//

import Foundation

// needs work, have design input now.

class NewPlaceViewModel: ObservableObject{
    
    @Published var aNewPlace = TherePlace()
    @Published var aNewPlaceNoOptionals = NewTherePlace()
    
    
    func convertObjectToDictionary() -> [String : Any] {
        
        let placeToWriteToFirebaseDictionary: [String: Any] = [
            "placeName": aNewPlace.placeType,
            "placeType": aNewPlace.placeName,
            "placeName": aNewPlace.placeName,
            "placeName": aNewPlace.placeName,
            "placeName": aNewPlace.placeName,
            "placeName": aNewPlace.placeName,
            "placeName": aNewPlace.placeName,
            "placeName": aNewPlace.placeName,
            "placeName": aNewPlace.placeName,
            "placeName": aNewPlace.placeName,
            "placeName": aNewPlace.placeName,
            "booleanExample": true,
            "numberExample": 3.14159265,
            
                ] // End docData Dictionary Array
        
        
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
    
        return placeToWriteToFirebaseDictionary
    
    } // End convertObjectToDictionary func
    
    // func returns the properties to nil if data has not been entered.
    func returnNoOptionals() {
        if aNewPlaceNoOptionals.placeType == "" { self.aNewPlace.placeType = nil }
        else { aNewPlace.placeType = aNewPlaceNoOptionals.placeType }
        
        if aNewPlaceNoOptionals.placeSuburb == "" { self.aNewPlace.placeSuburb = nil }
        else { aNewPlace.placeSuburb = aNewPlaceNoOptionals.placeSuburb }
        
        if aNewPlaceNoOptionals.placeCountry == "" { self.aNewPlace.placeCountry = nil }
        else { aNewPlace.placeCountry = aNewPlaceNoOptionals.placeCountry }
        
        if aNewPlaceNoOptionals.placeAddress == "" { self.aNewPlace.placeAddress = nil }
        else { aNewPlace.placeAddress = aNewPlaceNoOptionals.placeAddress }
        
        if aNewPlaceNoOptionals.placeState == "" { self.aNewPlace.placeState = nil }
        else { aNewPlace.placeState = aNewPlaceNoOptionals.placeState }
        
        if aNewPlaceNoOptionals.commentPublic == "" { self.aNewPlace.commentPublic = nil }
        else { aNewPlace.commentPublic = aNewPlaceNoOptionals.commentPublic }
        
        if aNewPlaceNoOptionals.commentPrivate == "" { self.aNewPlace.commentPrivate = nil }
        else { aNewPlace.commentPrivate = aNewPlaceNoOptionals.commentPrivate }
        
        if aNewPlaceNoOptionals.imageName == "" { self.aNewPlace.imageName = nil }
        else { aNewPlace.imageName = aNewPlaceNoOptionals.imageName }
        
    } // End Func

    func commitOptionalToPlace (stringToCommit: String?, stringPropertyToCommitTo: String?, intToCommit: Int?, intPropertyToCommitTo: String?) {
        
        if let stringToCommit = stringToCommit {
            guard stringPropertyToCommitTo != nil else {
                return
            } // End guard
            switch stringPropertyToCommitTo {
            case "placeType":
                aNewPlace.placeType = stringToCommit
            case "placeAddress":
                aNewPlace.placeAddress = stringToCommit
            case "placeSuburb":
                aNewPlace.placeSuburb = stringToCommit
            case "placeState":
                aNewPlace.placeState = stringToCommit
            case "placeCountry":
                aNewPlace.placeCountry = stringToCommit
            case "commentPublic":
                aNewPlace.commentPublic = stringToCommit
            case "commentPrivate":
                aNewPlace.commentPrivate = stringToCommit
            case "imageName":
                aNewPlace.imageName = stringToCommit
            case "whoAdded":
                aNewPlace.whoAdded = stringToCommit
            default:
                print("unknown variable attemtped to be converted to place property")
            } // End switch
        } // End If Let
        
        if let intToCommit = intToCommit {
            guard intPropertyToCommitTo != nil else {
                return
            } // End guard
            switch intPropertyToCommitTo {
            case "placeCountryCode":
                aNewPlace.placeCountryCode = intToCommit
            case "placeZip":
                aNewPlace.placeZip = intToCommit
            case "placeTypeI":
                aNewPlace.placeTypeI = intToCommit
            default:
                print("unknown variable attemtped to be converted to place property")
            } // end switch
        } // end if let
        
    } // end commitOptionalToPlace Function

} // End Class

