//
//  PlacesAPI.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 6/15/21.
//

// API Key: AIzaSyCJIUR-VTJ2RNJtyFLiI2EfeIMgct5HH6Y


// https://www.youtube.com/watch?v=Cd-B5_vkOFs&t=93s // Tutorial for this!
// TODO: use 'try await' when i get xcode 13 in network calls instead of a completion handler!
// TODO: https://www.youtube.com/watch?v=SQE5DZDqASA // swift WWDC update, includes 'try await' and 'searchable' @15mins for a dynamic live search for a place that is in memory


//
//  GooglePlacesManager.swift
//  TestGooglePlacesAPI
//
//  Created by Christian Zagorski on 6/16/21.
//

import Foundation
import GooglePlaces

final class GooglePlacesManager: ObservableObject {
    
    @Published var placesReturned = [APIPlace]()
    static let shared = GooglePlacesManager()
    let client = GMSPlacesClient.shared()
    var placeID: String = ""
    
    var addressFull: String = ""
    let token = GMSAutocompleteSessionToken.init()
    
    init() {}
    
    enum placeserror: Error {
        case failedtofind
    }
    
    func findPlaces(query: String, completion: @escaping (Result<[APIPlace], Error>) -> Void) {
        
        let filter = GMSAutocompleteFilter()
//        filter.type = .geocode
        client.findAutocompletePredictions(fromQuery: query, filter: filter, sessionToken: nil
        ) { results, error in
            guard let results = results, error == nil else {
                completion(.failure(placeserror.failedtofind))
                return
            }
            self.placesReturned = results.compactMap({
                APIPlace(
                    name: $0.attributedFullText.string,
                    type: $0.types,
                    identifier: $0.placeID
                    
                )
                
            })
            
            completion(.success(self.placesReturned))
            
        }
        
    } // End findPlaces Method
    
    func detailsCall(placeID: String) {
        
        let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt(GMSPlaceField.name.rawValue) |  UInt(GMSPlaceField.addressComponents.rawValue) |  UInt(GMSPlaceField.formattedAddress.rawValue) |  UInt(GMSPlaceField.coordinate.rawValue) |  UInt(GMSPlaceField.businessStatus.rawValue) |  UInt(GMSPlaceField.rating.rawValue))

        client.fetchPlace(fromPlaceID: placeID, placeFields: fields, sessionToken: token, callback: {
          (place: GMSPlace?, error: Error?) in
          if let error = error {
            print("An error occurred: \(error.localizedDescription)")
            return
          }
          if let place = place {
            print("array of detail place \(place)")
            print("NAME is: \(String(describing: place.name))")
            self.addressFull = place.formattedAddress ?? "nil"
            print("RATING is: \(Float16(place.rating))")
            print("ADDRESS COMPONENTS is: \(String(describing: place.addressComponents))")
            print("BUSINESS STATUS is: \(String(describing: place.businessStatus))")
            print("FORMATTED ADDRESS is: \(String(describing: place.formattedAddress))")
          }
        })
    }
    
} // End Class
