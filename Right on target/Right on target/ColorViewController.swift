//
//  ColorViewController.swift
//  Right on target
//
//  Created by Karen Vardanian on 21.08.2023.
//

import UIKit

class ColorViewController: UIViewController {
    var generator: GeneratorRandomColor! = nil
    var alert: Alert?

    var correctColorIndex: Int = 0
    var randomColor: UIColor!
    var round: Int = 0
    var score: Int = 0
    
    @IBOutlet weak var colorNameLabel: UILabel!
    
    @IBOutlet weak var color1: UIButton!
    @IBOutlet weak var color2: UIButton!
    @IBOutlet weak var color3: UIButton!
    @IBOutlet weak var color4: UIButton!
    
    
    let colorHexArray = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generator = GeneratorRandomColor(colorHexArray: colorHexArray)
        alert = Alert()
        
        playTheGame()
    }
    
    deinit {
        print(#function)
    }
    
    @IBAction func pressedButton(_ sender: UIButton) {
        if sender.tag == correctColorIndex {
            print("Правильный цвет выбран!")
            score += 1
            round += 1
            playTheGame()
        } else {
            print("Выбран неправильный цвет.")
            round += 1
            playTheGame()
        }
        
        
        if round == 5 {
            alert?.showAlert(self, title: "Game is over", message: "You have \(score) score", titleForButton: "Play again?")
            startNewRound()
        }
    }
  
    func playTheGame() {
        correctColorIndex = Int.random(in: 0..<4)
        randomColor = generator.randomColor()
        colorNameLabel.text = colorToHex(color: randomColor)
        
        let buttons: [UIButton] = [color1, color2, color3, color4]
        for (index, button) in buttons.enumerated() {
            colorSettings(button)
            
            if index == correctColorIndex {
                button.backgroundColor = randomColor
                button.tag = correctColorIndex
            }
        }
    }
    
    func startNewRound() {
        score = 0
        round = 0
    }
    
    
    func colorSettings(_ button: UIButton) {
        button.backgroundColor = generator.randomColor()
        button.layer.cornerRadius = 16
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 2
    }
    
    func colorToHex(color: UIColor) -> String? {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        if color.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            let redValue = Int(red * 255)
            let greenValue = Int(green * 255)
            let blueValue = Int(blue * 255)
            return String(format: "#%02X%02X%02X", redValue, greenValue, blueValue)
        }
        return nil
    }

}
