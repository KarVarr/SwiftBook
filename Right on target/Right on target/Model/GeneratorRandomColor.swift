//
//  GeneratorRandomColor.swift
//  Right on target
//
//  Created by Karen Vardanian on 22.08.2023.
//

import UIKit


protocol GeneratorProtocolColors {
    func randomColor() -> UIColor
}

class GeneratorRandomColor: GeneratorProtocolColors {

    private var colorHexArray: [String]
    
    internal init (colorHexArray: [String]) {
        self.colorHexArray = colorHexArray
    }

    
    func randomColor() -> UIColor {
        let firstColor = "\(colorHexArray.randomElement() ?? "0")\(colorHexArray.randomElement() ?? "0")"
        let secondColor = "\(colorHexArray.randomElement() ?? "0")\(colorHexArray.randomElement() ?? "0")"
        let thirdColor = "\(colorHexArray.randomElement() ?? "0")\(colorHexArray.randomElement() ?? "0")"

        let red = CGFloat(Int(firstColor, radix: 16) ?? 0) / 255.0
        let green = CGFloat(Int(secondColor, radix: 16) ?? 0) / 255.0
        let blue = CGFloat(Int(thirdColor, radix: 16) ?? 0) / 255.0

        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    
}
