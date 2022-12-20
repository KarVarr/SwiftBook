//
//  ViewController.swift
//  UIButtonAndUILabel
//
//  Created by Karen Vardanian on 20.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var actionButtons: [UIButton]!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.isHidden = true
        label.font = label.font.withSize(35)
        
        button.isHidden = true
        
        for button in actionButtons {
            button.setTitleColor(.black, for: .normal)
            button.backgroundColor = .green
        }
        
        
        button.setTitle("Clear", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        
    }
    
    @IBAction func pressedButton(_ sender: UIButton) {
        button.isHidden = false
        label.isHidden = false
        
        if sender.tag == 0 {
            label.text = "Hello World"
            label.textColor = .red
        } else if sender.tag == 1 {
            label.text = "Hey folks"
            label.textColor = .blue
        } else if sender.tag == 2 {
            label.isHidden = true
            button.isHidden = true
            
        }
        
        
        
        
        
    }
    
}

