//
//  TextView.swift
//  MVC-N
//
//  Created by Karen Vardanian on 24.07.2023.
//

import UIKit

class TextView {
    let text: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.textColor = .gray
        tv.font = UIFont.systemFont(ofSize: 14)
        tv.text = "Some text for lorem textview. and more text here and more text there, you just need more text for this view!"
        return tv
    }()
}
