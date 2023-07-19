//
//  LabelView.swift
//  ToDoFIRE
//
//  Created by Karen Vardanian on 19.07.2023.
//

import UIKit

class LabelView {
    
    let customLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "TamilSangamMN", size: 18)
        label.textColor = .white
        return label
    }()
    
}
