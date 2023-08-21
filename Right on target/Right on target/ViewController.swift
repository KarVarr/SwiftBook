//
//  ViewController.swift
//  Right on target
//
//  Created by Karen Vardanian on 19.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var game: Game! = nil
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    var updateLabelWithSecretNumber: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        game = Game(startValue: 1, endValue: 50, rounds: 5)
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }
    
    
    private func updateLabelWithSecretNumber(newText: String) {
        label.text = newText
    }
    
    
    @IBAction func checkNumber() {
        game.calculateScore(with: Int(self.slider.value))
        if game.isGameEnded {
            showAlertWith(score: game.score)
            game.restartGame()
        } else {
            game.startNewRound()
        }
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }
    
    private func getSecondViewController() -> SecondViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "SecondViewController")
        return viewController as! SecondViewController
        
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



