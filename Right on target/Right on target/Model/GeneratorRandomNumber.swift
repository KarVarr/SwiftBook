//
//  GeneratorRandomNumber.swift
//  Right on target
//
//  Created by Karen Vardanian on 21.08.2023.
//

import Foundation

protocol GeneratorProtocol {
    func getRandomValue() -> Int 
}

class GeneratorRandomNumber: GeneratorProtocol {
    
    private var startRangeValue: Int
    private var endRangeValue: Int
    
    internal init(startRangeValue: Int, endRangeValue: Int) {
        self.startRangeValue = startRangeValue
        self.endRangeValue = endRangeValue
    }
    
    
    func getRandomValue() -> Int {
        (startRangeValue...endRangeValue).randomElement()!
    }
    
    
}
