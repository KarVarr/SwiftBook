//
//  ViewController.swift
//  Alamofire
//
//  Created by Karen Vardanian on 29.07.2023.
//

import UIKit
import SnapKit
import Alamofire

class ViewController: UIViewController {
    
    let customTable = TableViewView()
    let array = [Int]()
    

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
        
        customTable.table.delegate = self
        customTable.table.dataSource = self
        customTable.table.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    private func layout() {
        customTable.table.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.bottom.equalTo(view.snp.bottom)
            make.leading.equalTo(view.snp.leading)
            make.right.equalTo(view.snp.right)
            
        }
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        return cell
    }
    
    
}
