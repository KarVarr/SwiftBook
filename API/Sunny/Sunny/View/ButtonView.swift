//
//  ButtonView.swift
//  Sunny
//
//  Created by Karen Vardanian on 15.07.2023.
//

import UIKit

class ButtonView {
    let customButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        return button
    }()
}
