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
    
    static func savePhoto(image: UIImage, userCompletionHandler: @escaping (String?, Error?) -> Void) {
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
//        let currentUserId = Auth.auth().currentUser
        
        // Create a firebase storage path (reference)
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let imagesRef = storageRef.child("images")
        let imagefileRef = imagesRef.child(filename)
        print("bucket \(storageRef.bucket)")//works
        print("child images: \(imagesRef)") //works
        print("child images with .fullpath: \(imagesRef.fullPath)") //just gives "images"
        print("image file path: \(imagefileRef)")
        
        
        // Upload the data
//        let data = Data()
        let uploadTask = imagefileRef.putData(photoData!, metadata: nil) { (metadata, error) in
          guard let metadata = metadata else {
            // Uh-oh, an error occurred!
            return
          }
          // Metadata contains file metadata such as size, content-type.
          let size = metadata.size
          // You can also access to download URL after upload.
          imagesRef.downloadURL { (url, error) in
            guard let downloadURL = url else {
              // Uh-oh, an error occurred!
              return
            }
          }
            userCompletionHandler(filename, nil)
        }
        
        // Upon successful upload, create database entry
    }
    
}
