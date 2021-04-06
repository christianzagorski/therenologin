//
//  PlaceViewModel.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/4/21.
//

import Foundation

class TherePlaceViewModel: ObservableObject {
    
    @Published var placesArray = [TherePlace]()
    
    func wantArrayCreator(allPlacesArray: [TherePlace]) -> [TherePlace] {
        var appendArray = [TherePlace]()
        
        for i in allPlacesArray {
            
            if i.wantToGo {
                print("hellloooo")
                appendArray.append(i)
                
            } // end if statement

            else {
            
            }

        } // End for loop
        
        return appendArray
    } // End function
    
    func beenArrayCreator(allPlacesArray: [TherePlace]) -> [TherePlace] {
        var appendArray = [TherePlace]()
        
        for i in allPlacesArray {
            
            if i.beenTo {
                print("hellloooo")
                appendArray.append(i)
                
            } // end if statement

            else {
            
            }

        } // End for loop
        
        return appendArray
    } // End function
    
    init() {
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
                    
                    // Assign to quotesArray property
                    self.placesArray = placeData
                
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
        
    } // End init method
    
} // End PizzaMenMod Class definition
