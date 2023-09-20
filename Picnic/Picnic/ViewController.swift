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
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
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
        self.view.layoutIfNeeded()
        
    }
    
    
}

