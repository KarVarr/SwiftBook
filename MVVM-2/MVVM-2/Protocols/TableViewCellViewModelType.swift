//
//  TableViewCellViewModelType.swift
//  MVVM-2
//
//  Created by Karen Vardanian on 25.07.2023.
//

import Foundation

protocol TableViewCellViewModelType: AnyObject {
    var fullName: String { get }
    var age: String { get }
}
