//
//  ActivityIndicatorView.swift
//  GCD
//
//  Created by Karen Vardanian on 27.06.2023.
//

import UIKit

class ActivityIndicatorView {
    let indicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.style = .large
        return activity
    }()
    
}
