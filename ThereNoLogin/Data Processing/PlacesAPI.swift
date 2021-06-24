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
    @Published var apiPlaceToBeSaved = APIPlace()
    var placeID: String = ""
    
    var addressFull: String = ""
    let token = GMSAutocompleteSessionToken.init()
    @Published var placePhoto = UIImage()
    
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
    
    func detailsCall(placeID: String, userCompletionHandler: @escaping (APIPlace?, Error?) -> Void) {
        
        let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt(GMSPlaceField.name.rawValue) |  UInt(GMSPlaceField.addressComponents.rawValue) |  UInt(GMSPlaceField.formattedAddress.rawValue) |  UInt(GMSPlaceField.coordinate.rawValue) |  UInt(GMSPlaceField.businessStatus.rawValue) |  UInt(GMSPlaceField.rating.rawValue) | UInt(GMSPlaceField.photos.rawValue))

        client.fetchPlace(fromPlaceID: placeID, placeFields: fields, sessionToken: token, callback: {
          (place: GMSPlace?, error: Error?) in
          if let error = error {
            print("An error occurred: \(error.localizedDescription)")
            return
          }
          if let place = place {
            // Get the metadata for the first photo in the place photo metadata list.
            let photoMetadata: GMSPlacePhotoMetadata = place.photos![0]
            savePhotoToMemory(photoLoad: photoMetadata)
            self.addressFull = place.formattedAddress ?? "nil"
            self.apiPlaceToBeSaved.name = place.name
            self.apiPlaceToBeSaved.identifier = place.placeID
            separateAddressComponents(addressComponents: place.addressComponents!)
            saveCoordinates(coordinates: place.coordinate)
            userCompletionHandler(self.apiPlaceToBeSaved, nil)
          }
        })
        
        
        func separateAddressComponents(addressComponents: [GMSAddressComponent]) {
            
            for addressComponent in addressComponents {
                        for type in (addressComponent.types){

                            switch(type){
                                case "country":
                                    self.apiPlaceToBeSaved.country = addressComponent.name

                                case "administrative_area_level_1":
                                    self.apiPlaceToBeSaved.state = addressComponent.name
                                    
                                case "locality":
                                    self.apiPlaceToBeSaved.city = addressComponent.name

                            default:
                                break
                            }

                        }
                    }
        } // End subfunction separateAddressComponents
        
        func saveCoordinates(coordinates: CLLocationCoordinate2D) {
            print("in savecoordinates sub method: \(coordinates.latitude)")
            let latco: Double = coordinates.latitude
            print("laco \(latco)")
            apiPlaceToBeSaved.coordinates = []
            apiPlaceToBeSaved.coordinates?.append(coordinates.latitude)
            apiPlaceToBeSaved.coordinates?.append(coordinates.longitude)
            
        } // End subfunction separateAddressComponents
        
        func savePhotoToMemory(photoLoad: GMSPlacePhotoMetadata) {

                // Call loadPlacePhoto to display the bitmap and attribution.
                self.client.loadPlacePhoto(photoLoad, callback: { (photo, error) -> Void in
                  if let error = error {
                    // TODO: Handle the error.
                    print("Error loading photo metadata: \(error.localizedDescription)")
                    return
                  } else {
                    // Display the first image and its attributions.
                    print("Saving photo to placePhoto property")
                    self.placePhoto = photo!
//                    self.lblText?.attributedText = photoLoad.attributions;
                  }
                })
            
        }
        
    }
    
    func saveAPICallPropsToNewPlace(newPlace: TherePlace) -> TherePlace {
        
        var exportNewPlace = newPlace
        exportNewPlace.placeName = apiPlaceToBeSaved.name!
        exportNewPlace.placeAddress = apiPlaceToBeSaved.formattedAddress
        exportNewPlace.placeSuburb = apiPlaceToBeSaved.city
        exportNewPlace.placeState = apiPlaceToBeSaved.state
        exportNewPlace.placeCountry = apiPlaceToBeSaved.country
        exportNewPlace.coordinates = apiPlaceToBeSaved.coordinates
   
        
        return exportNewPlace
        
    } // End saveAPICallPropsToNewPlace Method
    
} // End Class
