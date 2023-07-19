//
//  Helper.swift
//  ToDoFIRE
//
//  Created by Karen Vardanian on 19.07.2023.
//


import UIKit


enum Helper {
    //MARK: - Strings
    enum String {
        static let title = "ToDoFIRE"
        static let subtitle = "User does not exist!"
    }
    
    //MARK: - Fonts
        enum Fonts {
            static func TamilSangamMN(withSize size: CGFloat) -> UIFont {
                UIFont(name: "TamilSangamMN", size: size) ?? UIFont()
            }
        }

}
