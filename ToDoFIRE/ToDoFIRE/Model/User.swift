//
//  User.swift
//  ToDoFIRE
//
//  Created by Karen Vardanian on 22.07.2023.
//

import Foundation
import Firebase

struct User {
    let id: String
    let email: String
    
    init(user: User) {
        self.id = user.id
        self.email = user.email
    }
    
}
