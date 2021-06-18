//
//  DynamicSearchResultsTable.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 6/17/21.
//

import SwiftUI

struct DynamicSearchResultsTable: View {

    @EnvironmentObject var placesAPICall: GooglePlacesManager
//    let testarray: = ["1","2","3","4","5"]

    var body: some View {
        
        VStack {
            List(placesAPICall.placesReturned) { placesCall in
                HStack {
    
                    Text(placesCall.name)
//                    Text(placesCall.type)
                } // End HStack
//                .onTapGesture {
////                    
//                }
                
            } // End List

        } // End VStack
        
    } // End var body
} // End Struct

//
//struct DynamicSearchResultsTable_Previews: PreviewProvider {
//    static var previews: some View {
//        DynamicSearchResultsTable()
//    }
//}
