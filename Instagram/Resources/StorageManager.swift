//
//  StorageManager.swift
//  Instagram
//
//  Created by Alexander Knipfer on 10/3/20.
//

import FirebaseStorage

public class StorageManager {
    static let shared = StorageManager()
    
    private let bucket = Storage.storage().reference()
    
    public enum StorageManagerError: Error {
        case failedToDownload
    }
    
    public func uploadUserPost(model: UserPost, completion: @escaping (Result<URL, StorageManagerError>) -> Void) {
        
    }
    
    public func downloadImage(with reference: String, completion: @escaping (Result<URL, StorageManagerError>) -> Void) {
        bucket.child(reference).downloadURL(completion: { url, error in
            guard let url = url, error != nil else {
                completion(.failure(.failedToDownload))
                return
            }
            
            completion(.success(url))
        })
    }
}

public enum UserPostType {
    case photo, video
}

public struct UserPost {
    let postType: UserPostType
}

