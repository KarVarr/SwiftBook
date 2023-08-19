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
    var round: Int = 1
    var points: Int = 0
    
    override func loadView() {
        super.loadView()
        
        let versionLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
        versionLabel.text = "Версия 1.1"
        view.addSubview(versionLabel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        
        self.number = Int.random(in: 1...50)
        self.label.text = String(self.number)
    }
    
    @IBAction func checkNumber() {
        let numSlider = Int(self.slider.value)
        
        if numSlider > self.number {
            self.points += 50 - numSlider + self.number
        } else if numSlider < self.number {
            self.points += 50 - self.number + numSlider
        } else {
            self.points += 50
        }
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



