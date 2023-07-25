//
//  ViewModel.swift
//  MVVM-2
//
//  Created by Karen Vardanian on 25.07.2023.
//

import Foundation


class ViewModel: TableViewViewModelType {
    
    var profiles = [
        Profile(name: "John", secondName: "Black", age: 33),
        Profile(name: "Max", secondName: "Kolby", age: 21),
        Profile(name: "Mark", secondName: "Solmon", age: 55),
    ]
    
    func numberOfRows() -> Int {
        return profiles.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType {
        let profile = profiles[indexPath.row]
        return TableViewCellViewModel(profile: profile)
    }
    
}
