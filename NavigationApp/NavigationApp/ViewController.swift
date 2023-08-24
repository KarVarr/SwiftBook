//
//  ViewController.swift
//  NavigationApp
//
//  Created by Karen Vardanian on 24.08.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "New one"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "item"
        navigationItem.prompt = "test"
        navigationController?.navigationBar.tintColor = .orange
        navigationController?.navigationBar.barTintColor = .green.withAlphaComponent(0.7)
        navigationController?.navigationBar.backgroundColor = .white.withAlphaComponent(0.8)
        navigationItem.hidesSearchBarWhenScrolling = true
        navigationItem.searchController?.isActive = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
        
    }


}

