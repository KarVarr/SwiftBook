//
//  MainViewController.swift
//  Right on target
//
//  Created by Karen Vardanian on 19.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    var game: Game! = nil
    var round: Round! = nil
    var generator: GeneratorRandomNumber! = nil
    var alertAction: Alert?
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    var updateLabelWithSecretNumber: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        generator = GeneratorRandomNumber(startRangeValue: 1, endRangeValue: 50)
        game = Game(valueGenerator: generator, rounds: 5)
        updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue))
        alertAction = Alert()
    }
    
    
    private func updateLabelWithSecretNumber(newText: String) {
        label.text = newText
    }
    
    
    @IBAction func checkNumber() {
        game.currentRound.calculateScore(with:  Int(self.slider.value))
        if game.isGameEnded {
            showAlertWith(score: game.score)
            game.restartGame()
        } else {
            game.startNewRound()
        }
        updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue))
    }
    
    
    
    
    private func showAlertWith(score: Int) {
        if let alert = alertAction {
            alert.showAlert(self,title: "Игра окончена", message: "Вы заработали \(game.score) очков", titleForButton: "Начать заново")
        }
    }
    
    
    
    
}



