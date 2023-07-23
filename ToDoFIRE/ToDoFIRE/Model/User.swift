//
//  User.swift
//  ToDoFIRE
//
//  Created by Karen Vardanian on 22.07.2023.
//

import Foundation
import Firebase

struct User {
    let uid: String
    let email: String
    
    init(user: Firebase.User) {
        self.uid = user.uid
        self.email = user.email!
    }
    
}
