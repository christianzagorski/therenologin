//
//  DynamicSearchResultsTable.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 6/17/21.
//

import SwiftUI

struct DynamicSearchResultsTable: View {

    @EnvironmentObject var placesAPICall: GooglePlacesManager
    @EnvironmentObject var newPlaceVM: NewPlaceViewModel

    var body: some View {
        
        NavigationView {
            VStack {
                List(placesAPICall.placesReturned) { placesCall in
                    HStack {
        
                        Text(placesCall.name!)
                    } // End HStack
                    .onTapGesture {
                        placesAPICall.placeID = placesCall.identifier!
                        placesAPICall.apiPlaceToBeSaved.type = placesCall.type
                        placesAPICall.detailsCall(placeID: placesAPICall.placeID, userCompletionHandler: { apiCallToSave, error in
                                                       
                        newPlaceVM.goToConfigView = true
                        })
                    }
                    
                } // End List

            } // End VStack
        
        } // End Navigation View
            
    } // End var body
} // End Struct

//
//struct DynamicSearchResultsTable_Previews: PreviewProvider {
//    static var previews: some View {
//        DynamicSearchResultsTable()
//    }
//}
