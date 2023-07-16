//
//  VC + Extensions.swift
//  Sunny
//
//  Created by Karen Vardanian on 16.07.2023.
//

import UIKit

extension ViewController {
    func presentSearchAlertController(withTitle title: String, message: String?, style: UIAlertController.Style) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        ac.addTextField { [self] tf in
            tf.placeholder = self.city.allCities.randomElement()
        }
        
        let search = UIAlertAction(title: "Search", style: .default) { action in
            let textField = ac.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
                print("Search info for the \(cityName)")
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        ac.addAction(search)
        ac.addAction(cancel)
        
        present(ac, animated: true)
    }
}
