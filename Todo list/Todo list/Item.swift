//
//  Item.swift
//  Todo list
//
//  Created by Karen Vardanian on 14.01.2024.
//

import Foundation

struct Item: Identifiable, Codable {
    var id = UUID()
    var todo: String
}
