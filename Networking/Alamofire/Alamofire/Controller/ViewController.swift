//
//  ViewController.swift
//  Alamofire
//
//  Created by Karen Vardanian on 29.07.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let customTable = TableViewView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        settings()
        layout()
    }
    
    private func addView() {
        view.addSubview(customTable.table)
    }
    
    private func settings() {
        view.backgroundColor = .orange
    }
    
    private func layout() {
        
    }


}

extension ViewController {
    
}
