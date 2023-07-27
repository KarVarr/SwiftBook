//
//  DetailViewModelType.swift
//  MVVM-2
//
//  Created by Karen Vardanian on 25.07.2023.
//

import Foundation


protocol DetailViewModelType {
    var description: String { get }
    var age: Box<String?> { get }
}
