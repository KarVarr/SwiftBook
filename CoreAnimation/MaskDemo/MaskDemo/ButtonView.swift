//
//  ButtonView.swift
//  MaskDemo
//
//  Created by Karen Vardanian on 19.07.2023.
//

import UIKit

@IBDesignable
class ButtonView: UIButton {
    private var cornerRadii = CGSize()
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            cornerRadii = CGSize(width: cornerRadius, height: cornerRadius)
        }
    }
    
    
    var path: UIBezierPath?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
    
        path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .bottomRight], cornerRadii: cornerRadii)
        UIColor.green.setFill()
        path?.fill()
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if let path = path {
            return path.contains(point)
        }
        return false
    }

}
