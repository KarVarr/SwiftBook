//
//  ViewController.swift
//  Right on target
//
//  Created by Karen Vardanian on 19.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    var number: Int = 0
    var round: Int = 0
    var points: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func checkNumber() {
        
        if self.round == 0 {
            self.number = Int.random(in: 1...50)
            self.label.text = String(self.number)
            self.round = 1
        } else {
            
            let numSlider = Int(self.slider.value.rounded()) // сравниваем значение с загаданным
            
            if numSlider > self.number {
                self.points += 50 - numSlider + self.number } else if numSlider < self.number {
                    self.points += 50 - self.number + numSlider } else {
                        self.points += 50 }
            if self.round == 5 {
                
                let alert = UIAlertController(
                    title: "Игра окончена",
                    message: "Вы заработали \(self.points) очков", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                self.round = 1
                self.points = 0
            } else {
                self.round += 1
            }
            
            self.number = Int.random(in: 1...50)
        }
    }
    
}

