//
//  ButtonView.swift
//  GCD
//
//  Created by Karen Vardanian on 27.06.2023.
//

import UIKit

class ButtonView {
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Press", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        return button
    }()
}
