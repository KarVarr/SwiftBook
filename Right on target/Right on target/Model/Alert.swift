//
//  Alert.swift
//  Right on target
//
//  Created by Karen Vardanian on 22.08.2023.
//

import UIKit

protocol AlertProtocol {

    func showAlert(_ viewController: UIViewController, title: String, message: String, titleForButton: String)
}

class Alert: AlertProtocol {

    func showAlert(_ viewController: UIViewController, title: String, message: String, titleForButton: String) {
        let alert = UIAlertController (
            title: title,
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: titleForButton, style: .default, handler: nil))
        viewController.present(alert, animated: true)
        
    }
}
