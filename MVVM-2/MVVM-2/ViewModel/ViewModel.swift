//
//  ViewModel.swift
//  MVVM-2
//
//  Created by Karen Vardanian on 25.07.2023.
//

import Foundation


class ViewModel: TableViewModelType {
    
    var profiles = [
        Profile(name: "John", secondName: "Black", age: 33),
        Profile(name: "Max", secondName: "Kolby", age: 21),
        Profile(name: "Mark", secondName: "Solmon", age: 55),
    ]
    
    var numberOfRows: Int {
        return profiles.count
    }
}
