//
//  ButtonView.swift
//  ToDoFIRE
//
//  Created by Karen Vardanian on 19.07.2023.
//

import UIKit


class ButtonView {
    let customButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("press", for: .normal)
        button.tintColor = UIColor.white
        return button
    }()
}
