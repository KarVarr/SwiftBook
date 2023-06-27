//
//  ImageView.swift
//  GCD
//
//  Created by Karen Vardanian on 27.06.2023.
//

import UIKit

class ImageView {
    let customImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .lightGray
        image.sizeToFit()
        image.contentMode = .scaleAspectFill
        return image
    }()
}
