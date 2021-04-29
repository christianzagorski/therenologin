//
//  JsonDataProcessing.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/26/21.
//

import Foundation

// class decodes the local json file in the app.

class JsonDataProcessor {
    

    static func getLocalData() -> [TherePlace] {
        // TODO: Havent created the data file yet, check naming
        let pathString = Bundle.main.path(forResource: "BeenWantData2", ofType: "json")
        
        // TODO: Copied from pizza - this is optional binding statement?? Check what it is doing again
        if let path = pathString {
            
            // Create a URL Object
            let url = URL(fileURLWithPath: path)
            
            // Error handling
            do {
            
                // Create data object with the data at the url
                let data = try Data(contentsOf: url)

                
                // Parse the data
                let decoder = JSONDecoder()
                
                do {
                    // Decode the data into a constant
                    var placeData = try decoder.decode([TherePlace].self, from: data)
                
                     // Loop through places and add Id's
                     for index in 0..<placeData.count {
                        placeData[index].id = UUID()
                    
                     } // End For loop
                    return placeData
                
                } // End Second do
                
                catch { // Couldnt decode JSON
                    print("Couldnt decode that JSON file")
                
                } // End Catch
            
            } // End first do
            
            catch {
                // Execuation will come here if an error is thrown
                print("Problem with the path Url for the JSON file")
            } // End first catch
            
        } // End path optional binding check
        
        // return array property
        
        return [TherePlace]()

        
    } // End init method

}
