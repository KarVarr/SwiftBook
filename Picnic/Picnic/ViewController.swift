//
//  ViewController.swift
//  Picnic
//
//  Created by Karen Vardanian on 20.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var basketBottom: UIImageView!
    @IBOutlet weak var basketTop: UIImageView!
    
    @IBOutlet weak var fabricTop: UIImageView!
    @IBOutlet weak var fabricBottom: UIImageView!
    
    @IBOutlet weak var bug: UIImageView!
    var isBugDead = false
    
    var tap: UITapGestureRecognizer?
    
    init(basketBottom: UIImageView!, basketTop: UIImageView!, fabricTop: UIImageView!, fabricBottom: UIImageView!, bug: UIImageView!, isBugDead: Bool = false, tap: UITapGestureRecognizer? = nil) {
        super.init(nibName:  nil, bundle: nil)
        self.basketBottom = basketBottom
        self.basketTop = basketTop
        self.fabricTop = fabricTop
        self.fabricBottom = fabricBottom
        self.bug = bug
        self.isBugDead = isBugDead
        self.tap = tap
        self.tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
                bug.isUserInteractionEnabled = true
                bug.addGestureRecognizer(tapGesture)

        
        view.layoutIfNeeded()
        UIView.animate(withDuration: 0.7, delay: 1.0, options: .curveEaseOut, animations: {
            var basketTopFrame = self.basketTop.frame
            basketTopFrame.origin.y -= basketTopFrame.size.height
            var basketBottomFrame = self.basketBottom.frame
            basketBottomFrame.origin.y += basketBottomFrame.size.height
            self.basketTop.frame = basketTopFrame
            self.basketBottom.frame = basketBottomFrame
        }, completion: { finished in
            print("Basket doors opened!")
            
        })
        
        UIView.animate(withDuration: 1.0, delay: 1.2, options: .curveEaseIn, animations:  {
            var fabricTopFrame = self.fabricTop.frame
            fabricTopFrame.origin.y -= fabricTopFrame.size.height
            var fabricBottomFrame = self.fabricBottom.frame
            fabricBottomFrame.origin.y += fabricBottomFrame.size.height
            
            self.fabricTop.frame = fabricTopFrame
            self.fabricBottom.frame = fabricBottomFrame
        }, completion: { _ in
            print("Napkins opened!")
        })
        
        self.view.layoutIfNeeded()
        
        moveBugLeft()
        
        if let tap = tap {
            view.addGestureRecognizer(tap)
        }
        
    }
    
    func moveBugLeft() {
        if isBugDead { return }
        UIView.animate(withDuration: 1.0, delay: 2.0, options: [.allowUserInteraction, .curveEaseOut], animations: {
            self.bug.center = CGPoint(x: 75, y: 200)
        }, completion: { _ in
            print("Bug moved left!")
            self.faceBugRight()
        })
    }
    func faceBugRight() {
        if isBugDead { return }
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [.allowUserInteraction, .curveEaseOut], animations: {
            self.bug.transform = CGAffineTransformMakeRotation(CGFloat(Double.pi))
        }, completion: { _ in
            print("Bug faced right!")
            self.moveBugRight()
        })
    }
    
    func moveBugRight() {
        if isBugDead { return }
        UIView.animate(withDuration: 1.0, delay: 2.0, options: [.allowUserInteraction, .curveEaseOut], animations: {
            self.bug.center = CGPoint(x: 230, y: 250)
        }, completion: { _ in
            print("Bug moved right!")
            self.faceBugLeft()
        })
    }
    
    func faceBugLeft() {
        if isBugDead { return }
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [.allowUserInteraction, .curveEaseOut], animations: {
            self.bug.transform = CGAffineTransformMakeRotation(0.0)
        }, completion: { _ in
            print("Bug faced left!")
            self.moveBugLeft()
        })
    }
    
    
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        if isBugDead { return }
                
                isBugDead = true
                bug.isUserInteractionEnabled = false
                
                UIView.animate(withDuration: 0.7, delay: 0.0, options: .curveEaseOut, animations: {
                    self.bug.transform = CGAffineTransform(scaleX: 1.25, y: 0.75)
                }, completion: { finished in
                    UIView.animate(withDuration: 2.0, delay: 2.0, animations: {
                        self.bug.alpha = 0.0
                    }, completion: { finished in
                        self.bug.removeFromSuperview()
                    })
                })
                
                print("Bug tapped!")
        
        
    }

    
}

