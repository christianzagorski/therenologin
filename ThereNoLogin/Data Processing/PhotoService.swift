//
//  PhotoService.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 5/4/21.
//

import Foundation
import FirebaseStorage
import FirebaseFirestore
import FirebaseAuth


class PhotoService {
    
    static func savePhoto(image:UIImage) {
        // Get the data represenation of the UIImage
        let photoData = image.jpegData(compressionQuality: 0.1)
        
        guard photoData != nil else {
            // Error, couldnt get data from the UI Image
            print("Error, couldnt get data from the UI Image")
            return
        }
        // Create the filename
        let filename = UUID().uuidString
        
        
        // Get the userid of the current user
//        let userID =
        
        // Create a firebase storage path (reference)
        
        // Upload the data
        
        // Upon successful upload, create database entry
    }
    
}
