//
//  AuthenticationManager.swift
//  Instagram
//
//  Created by Alexander Knipfer on 10/3/20.
//

import FirebaseAuth

public class AuthenticationManager {
    static let shared = AuthenticationManager()
    
    public func registerNewUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        DatabaseManager.shared.canCreateNewUser(with: email, username: username) { canCreate in
            if canCreate {
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    guard error == nil, result != nil else {
                        completion(false)
                        return
                    }
                }
                
                DatabaseManager.shared.insertNewUser(with: email, username: username) { inserted in
                    if inserted {
                        completion(true)
                        return
                    } else {
                        completion(false)
                        return
                    }
                }
            } else {
                completion(false)
            }
        }
    }
    
    public func login(username: String?, email: String?, password: String, completion: @escaping ((Bool) -> Void)) {
        if let email = email {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                
                completion(true)
            }
        }
        else if let username = username {
            print(username)
        }
    }
}
