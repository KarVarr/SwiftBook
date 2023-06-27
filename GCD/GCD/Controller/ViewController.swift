//
//  ViewController.swift
//  GCD
//
//  Created by Karen Vardanian on 27.06.2023.
//

import UIKit

class ViewController: UIViewController {
    let customButton = ButtonView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        addView()
        settings()
        layout()
    }
    
    func addView() {
        view.addSubview(customButton.button)
    }
    
    func settings() {
        title = "GCD Application Test"
        
        view.backgroundColor = .white
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        customButton.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    func layout() {
        let btn = customButton.button
        
        NSLayoutConstraint.activate([
            btn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            btn.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    
    @objc func buttonTapped() {
        let secondVC = SecondViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }


}

