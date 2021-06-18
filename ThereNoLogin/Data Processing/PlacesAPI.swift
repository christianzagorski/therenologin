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
    
    init() {}
    
    enum placeserror: Error {
        case failedtofind
    }
//    public func setup() {
//        GMSPlacesClient.provideAPIKey("AIzaSyCJIUR-VTJ2RNJtyFLiI2EfeIMgct5HH6Y") // AIzaSyCJIUR-VTJ2RNJtyFLiI2EfeIMgct5HH6Y - real key for travel gems
//
//    }
    
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
        
        
        
        
    }
    
    }
    



