//
//  TasksViewController.swift
//  ToDoFIRE
//
//  Created by Karen Vardanian on 19.07.2023.
//

import UIKit
import Firebase

class TasksViewController: UIViewController {
    
    let tableVC = TableViewCustom()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        settings()
        layout()
    }
    
    
    func addViews() {
        view.addSubview(tableVC.table)
    }
    
    func settings() {
        view.backgroundColor = .orange
        title = "Tasks"
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(signOutTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        
        tableVC.table.register(TableViewCell.self, forCellReuseIdentifier: Helper.String.cellKey)
        tableVC.table.delegate = self
        tableVC.table.dataSource = self
    }
    
    func layout() {
        let tableVC = tableVC.table
        NSLayoutConstraint.activate([
            tableVC.topAnchor.constraint(equalTo: view.topAnchor),
            tableVC.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableVC.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableVC.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    @objc func addTapped() {
        let ac = UIAlertController(title: "New Task", message: "Write a new task here:", preferredStyle: .alert)
        ac.addTextField()
        let save = UIAlertAction(title: "Save", style: .default) { [weak self] _ in
            guard let textField = ac.textFields?.first, textField.text != "" else {
                let alert = UIAlertController(title: "No Task", message: "Please write a task", preferredStyle: .actionSheet)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self?.present(alert, animated: true)
                return
            }
            
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        ac.addAction(save)
        ac.addAction(cancel)
        present(ac, animated: true)
    }
    
    
    @objc func signOutTapped() {
        do {
            try Auth.auth().signOut()
        } catch  {
            print(error.localizedDescription)
        }
        
        
        
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
            return
        }
    }
    
    
}


extension TasksViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Helper.String.cellKey, for: indexPath) as! TableViewCell
        cell.label.customLabel.text = "Number of the cell \(indexPath.row)"
        return cell
    }
    
    
}
