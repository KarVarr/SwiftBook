//
//  LabelView.swift
//  MVC-N
//
//  Created by Karen Vardanian on 24.07.2023.
//

import UIKit

class LabelView {
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Test for cell"
        return label
    }()
}
