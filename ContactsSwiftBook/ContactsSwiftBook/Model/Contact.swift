//
//  Contact.swift
//  ContactsSwiftBook
//
//  Created by Karen Vardanian on 23.08.2023.
//

import Foundation


protocol ContactProtocol {
    var title: String { get set }
    var phone: String { get set }
}

struct Contact: ContactProtocol {
    var title: String
    
    var phone: String
    
    
}
