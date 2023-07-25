//
//  TableViewCellViewModel.swift
//  MVVM-2
//
//  Created by Karen Vardanian on 25.07.2023.
//

import Foundation

class TableViewCellViewModel: TableViewCellViewModelType {
    var fullName: String {
        return profile.name + " " + profile.secondName
    }
    
    var age: String {
        return String(profile.age)
    }
    
    private var profile: Profile
    
    init(profile: Profile) {
        self.profile = profile
    }
}
