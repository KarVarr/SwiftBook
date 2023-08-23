//
//  ViewController.swift
//  ContactsSwiftBook
//
//  Created by Karen Vardanian on 23.08.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        var configuration = cell.defaultContentConfiguration()
        configuration.text = "string \(indexPath.row)"
        configuration.secondaryText = "Pidr \(indexPath.row)"
        configuration.textProperties.color = .red

    
        return cell
    }
    
    
}

