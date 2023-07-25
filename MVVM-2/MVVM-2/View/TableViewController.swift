//
//  ViewController.swift
//  MVVM-2
//
//  Created by Karen Vardanian on 25.07.2023.
//

import UIKit


class TableViewController: UITableViewController {
    
    var viewModel: TableViewModelType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        setting()
        layout()
        
        viewModel = ViewModel()
        
    }
    
    private func addViews() {
        
    }
    
    private func setting() {
        view.backgroundColor = .orange
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func layout() {
        
    }
    
    
    
    
    
}

extension TableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        guard let viewModel = viewModel else { return UITableViewCell()}
        
        let profile = viewModel.profiles[indexPath.row]
        
        cell.fullNameLabel.customLabel.text = "\(profile.name) \(profile.secondName)"
        cell.ageLabel.customLabel.text = "\(profile.age)"
        
        return cell
    }
}
