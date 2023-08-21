//
//  ViewController.swift
//  Right on target
//
//  Created by Karen Vardanian on 19.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var game: Game! = nil
    var round: Round! = nil
    var generator: GeneratorRandomNumber! = nil
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    var updateLabelWithSecretNumber: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        generator = GeneratorRandomNumber(startRangeValue: 1, endRangeValue: 50)
        game = Game(valueGenerator: generator, rounds: 5)
        updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue))
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
        let alert = UIAlertController (
            title: "Игра окончена",
            message: "Вы заработали \(score) очков",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    
}



