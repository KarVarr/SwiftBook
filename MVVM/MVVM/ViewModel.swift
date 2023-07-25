//
//  ViewModel.swift
//  MVVM
//
//  Created by Karen Vardanian on 25.07.2023.
//

import Foundation


class ViewModel {
    private var profile = Profile(name: "John", secondName: "Black", age: 33)
    
    var name: String {
        return profile.name
    }
    
    var secondName: String {
        return profile.secondName
    }
    
    var age: String {
        return String(profile.age)
    }
}
