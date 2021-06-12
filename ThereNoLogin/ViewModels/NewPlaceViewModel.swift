//
//  NewPlaceViewModel.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/9/21.
//

import Foundation

// needs work, have design input now.

class NewPlaceViewModel: ObservableObject {
    
    @Published var aNewPlace = TherePlace()
    @Published var aNewPlaceNoOptionals = NewTherePlace()
    @Published var showNewPlace: Bool = false
    @Published var goToConfigView: Bool = false
    
    // TODO - rename this and clean up
    func testDictionaryExtension() -> [String: Any] {
        let a = aNewPlace
        print(a.dictionary)
        let b = a.dictionary
        
        return b!
    }
    
   // TODO - I think this is no longer needed - Check
    
    func convertObjectToDictionary() -> [String : Any] {
        var placeToWriteToFirebaseDictionary: [String: String] = [:]
        
        if let placeType = aNewPlace.placeType {
            placeToWriteToFirebaseDictionary["placeType"] = placeType
        }
        
        //        var placeTypeI: Int?
        if let placeType = aNewPlace.placeType {
            placeToWriteToFirebaseDictionary["placeType"] = placeType
        }
        
        //        var placeName: String = ""
        if let placeType = aNewPlace.placeType {
            placeToWriteToFirebaseDictionary["placeType"] = placeType
        }
        
        //        var placeAddress: String?
        if let placeType = aNewPlace.placeType {
            placeToWriteToFirebaseDictionary["placeType"] = placeType
        }
        
        //        var placeSuburb: String?
        if let placeType = aNewPlace.placeType {
            placeToWriteToFirebaseDictionary["placeType"] = placeType
        }
        
        //        var placeZip: Int?
        if let placeType = aNewPlace.placeType {
            placeToWriteToFirebaseDictionary["placeType"] = placeType
        }
        
        //        var placeState: String?
        if let placeType = aNewPlace.placeType {
            placeToWriteToFirebaseDictionary["placeType"] = placeType
        }
        
        //        var placeCountry: String?
        if let placeType = aNewPlace.placeType {
            placeToWriteToFirebaseDictionary["placeType"] = placeType
        }
        
        //        var placeCountryCode: Int?
        if let placeType = aNewPlace.placeType {
            placeToWriteToFirebaseDictionary["placeType"] = placeType
        }

        //        var latGPS: Float16?
        if let placeType = aNewPlace.placeType {
            placeToWriteToFirebaseDictionary["placeType"] = placeType
        }
        
        //        var lonGPS: Float16?
        if let placeType = aNewPlace.placeType {
            placeToWriteToFirebaseDictionary["placeType"] = placeType
        }
        
        //        var dateVisitedStart: Date?
        if let placeType = aNewPlace.placeType {
            placeToWriteToFirebaseDictionary["placeType"] = placeType
        }
        
        //        var dateVisitedEnd: Date?
        if let placeType = aNewPlace.placeType {
            placeToWriteToFirebaseDictionary["placeType"] = placeType
        }
        
        //        var timeVisitedStart: Date?
        if let placeType = aNewPlace.placeType {
            placeToWriteToFirebaseDictionary["placeType"] = placeType
        }
        
        //        var timeVisitedEnd: Date?
        if let placeType = aNewPlace.placeType {
            placeToWriteToFirebaseDictionary["placeType"] = placeType
        }
        
        //        var commentPublic: String?
        if let placeType = aNewPlace.placeType {
            placeToWriteToFirebaseDictionary["placeType"] = placeType
        }

        //        var commentPrivate: String?
        if let placeType = aNewPlace.placeType {
            placeToWriteToFirebaseDictionary["placeType"] = placeType
        }
        
        //        var imageName: String?
        if let placeType = aNewPlace.placeType {
            placeToWriteToFirebaseDictionary["placeType"] = placeType
        }
        
        //        var wantOrFav: Bool = true
        if let placeType = aNewPlace.placeType {
            placeToWriteToFirebaseDictionary["placeType"] = placeType
        }
        
        if let placeType = aNewPlace.placeType {
            placeToWriteToFirebaseDictionary["placeType"] = placeType
        }
        
        //        var privateSpot: Bool = false
        if let placeType = aNewPlace.placeType {
            placeToWriteToFirebaseDictionary["placeType"] = placeType
        }
        
        //        var whenAdded: Date?
        if let placeType = aNewPlace.placeType {
            placeToWriteToFirebaseDictionary["placeType"] = placeType
        }

        //        var whoAdded: String?
        if let placeType = aNewPlace.placeType {
            placeToWriteToFirebaseDictionary["placeType"] = placeType
        }

    
        return placeToWriteToFirebaseDictionary
    
    } // End convertObjectToDictionary func
    
    // func returns the properties to nil if data has not been entered.
    func returnNoOptionals() {
        
        aNewPlace.id = UUID()
        
        aNewPlace.placeName = aNewPlaceNoOptionals.placeName
        
        aNewPlace.wantOrFav = aNewPlaceNoOptionals.wantOrFav
        
        aNewPlace.privateSpot = aNewPlaceNoOptionals.privateSpot
        
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

    // TODO - I think this is not needed now - Check
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
    
    // TODO - need to make a method (or decide where else it should go) that clears all properties when you click back and/or you 'add new place'

} // End Class

