//
//  Round.swift
//  Right on target
//
//  Created by Karen Vardanian on 21.08.2023.
//

import Foundation

protocol RoundProtocol {
    var score: Int { get }
    var currentSecretValue: Int { get }
    
    func calculateScore(with: Int)
}


class Round: RoundProtocol {
    var score: Int = 0
    var currentSecretValue: Int = 0
    
    init( secretValue: Int) {
        self.currentSecretValue = secretValue
    }
    
    func calculateScore(with value: Int) {
        if value > currentSecretValue {
            score += 50 - value + currentSecretValue
        } else if value < currentSecretValue {
            score += 50 - currentSecretValue + value
        } else {
            score += 50
        }
    }
    
    
}
