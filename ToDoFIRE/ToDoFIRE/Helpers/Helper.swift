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
        static let email = "Email"
        static let password = "Password"
        static let login = "Login"
        static let register = "Register"
    }
    
    //MARK: - Fonts
        enum Fonts {
            static func TamilSangamMN(withSize size: CGFloat) -> UIFont {
                UIFont(name: "TamilSangamMN", size: size) ?? UIFont()
            }
        }

}
