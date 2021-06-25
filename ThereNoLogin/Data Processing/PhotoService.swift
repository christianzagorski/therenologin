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


class PhotoService: ObservableObject {
    
    let storage = Storage.storage()
    @Published var myimageToPass = UIImage()
    @Published var imageToPass = UIImage()
    
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
    
    
    func loadPhoto(filename: String, userCompletionHandler: @escaping (UIImage?, Error?) -> Void) {

        let storageRef = storage.reference()
        let imagesRef = storageRef.child("images")
        let imagefileRef = imagesRef.child(filename)
        
        
        
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        
        print("imagefileRef: \(imagefileRef)")
        
        
        imagefileRef.getData(maxSize: 1 * 1024 * 1024) { data1, error in
          if let error = error {
            print("an error occured \(error)")
            // Uh-oh, an error occurred!
          } else {
            // Data for "images/island.jpg" is returned
            let image = UIImage(data:data1!,scale:1.0)
            self.myimageToPass = image!
          }
        }
        userCompletionHandler(imageToPass, nil)
        
    } // end testMyFirebasePhotoJpg method
    
}
