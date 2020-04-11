//
//  CoreData.swift
//  SignUpPage
//
//  Created by Joel Joseph on 12/15/19.
//  Copyright © 2019 Joel Joseph. All rights reserved.
//

import Combine
import CloudKit
import Foundation
import FirebaseAuth


class Core:ObservableObject{
    
    @Published var isSetUp:Bool? 
    var didChange = PassthroughSubject<Core, Never>()
    var profile: Profile? { didSet { self.didChange.send(self) }}
    var handle: AuthStateDidChangeListenerHandle?
    let user = Auth.auth().currentUser
    
    func listen () {
        // monitor authentication changes using firebase
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                // if we have a user, create a new user model
                print("Got user: \(user)")
                self.profile = Profile(id: user.uid, email: user.email!)
                
            } else {
                // if we don't have a user, set our session to nil
                self.profile = nil
            }
        }
    }
    
    func createUser(email: String, password: String, _ callback: ((Error?) -> ())? = nil){
          Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
              if let e = error{
                  callback?(e)
                  return
              }
              callback?(nil)
            print("Account Creation Successful")
            
          }
        
    }
    
    func login(withEmail email: String, password: String, _ callback: ((Error?) -> ())? = nil){
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let e = error{
                callback?(e)
                return
            }
            callback?(nil)
            print("Login Successful")
        }
    }
    
    func signUp(
        email: String,
        password: String,
        handler: @escaping AuthDataResultCallback
        ) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }
    
    func signIn(
        email: String,
        password: String,
        handler: @escaping AuthDataResultCallback
        ) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
        
    }
    
    func deleteAccount(){
        user?.delete{error in
            if let error = error {
              // An error happened.
            } else {
              // Account deleted.
            }
        }
    }
    
    
    
}


class Profile:ObservableObject{
    
    var id:String?
    var email:String?
    
    
    init(id:String, email:String){
        self.id = id
        self.email = email
    }

}
