//
//  StackView.swift
//  MVVM
//
//  Created by Karen Vardanian on 25.07.2023.
//

import UIKit

class StackView {
    let customStackView: UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
}
