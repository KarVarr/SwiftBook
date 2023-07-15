//
//  ImageView.swift
//  Sunny
//
//  Created by Karen Vardanian on 15.07.2023.
//

import UIKit

class ImageView {
    let customImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        
        return image
    }()
}
