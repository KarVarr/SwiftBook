//
//  LabelView.swift
//  MVVM-2
//
//  Created by Karen Vardanian on 25.07.2023.
//

import UIKit

class LabelView {
    let customLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font.withSize(18)
        label.text = "test Test"
        return label
    }()
}
