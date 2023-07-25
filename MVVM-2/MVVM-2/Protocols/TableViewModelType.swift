//
//  TableViewModelType.swift
//  MVVM-2
//
//  Created by Karen Vardanian on 25.07.2023.
//

import Foundation


protocol TableViewModelType {
    var numberOfRows: Int { get }
    var profiles: [Profile] { get }
}
