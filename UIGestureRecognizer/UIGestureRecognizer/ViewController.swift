//
//  ViewController.swift
//  UIGestureRecognizer
//
//  Created by Karen Vardanian on 01.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        swiperObservers()
        tapObserver()
    }
    
    func swiperObservers() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handlerSwipes))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handlerSwipes))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handlerSwipes))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handlerSwipes))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    
    func tapObserver() {
        let tripleTap = UITapGestureRecognizer(target: self, action: #selector(tripleTapAction))
        tripleTap.numberOfTapsRequired = 3
        self.view.addGestureRecognizer(tripleTap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapAction))
        doubleTap.require(toFail: tripleTap)
        doubleTap.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(doubleTap)
    }
    
    @objc func handlerSwipes (gester: UISwipeGestureRecognizer) {
        switch gester.direction {
        case .right:
            label.text = "Right swipe was recognize"
        case .left:
            label.text = "Left swipe was recognize"
        case .up:
            label.text = "Up swipe was recognize"
        case .down:
            label.text = "Down swipe was recognize"
        default:
            break
        }
    }
    
    @objc func tripleTapAction () {
        label.text = "tapped 3 times"
    }
    
    @objc func doubleTapAction () {
        label.text = "tapped 2 times"
    }
    
    
}

