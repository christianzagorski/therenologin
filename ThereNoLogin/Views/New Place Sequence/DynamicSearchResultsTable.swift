//
//  DynamicSearchResultsTable.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 6/17/21.
//

import SwiftUI

struct DynamicSearchResultsTable: View {

    @EnvironmentObject var placesAPICall: GooglePlacesManager


    var body: some View {
        
        List(placesAPICall.placesReturned) { placescall in
            
            
        }
    }
}

//
//struct DynamicSearchResultsTable_Previews: PreviewProvider {
//    static var previews: some View {
//        DynamicSearchResultsTable()
//    }
//}
