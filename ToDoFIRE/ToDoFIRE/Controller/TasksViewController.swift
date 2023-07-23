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
    
    var user: User!
    var ref: DatabaseReference!
    var tasks = Array<Task>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        firebaseSettings()
        settings()
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ref.observe(.value) { [weak self] (snapshot) in
            var _tasks = Array<Task>()
            for item in snapshot.children {
                let task = Task(snapshot: item as! DataSnapshot)
                _tasks.append(task)
            }
            
            self?.tasks = _tasks
            self?.tableVC.table.reloadData()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        ref.removeAllObservers()
    }
    
    
    func addViews() {
        view.addSubview(tableVC.table)
    }
    
    func firebaseSettings() {
        guard let currentUser = Auth.auth().currentUser else { return }
        user = User(user: currentUser)
        ref = Database.database().reference(withPath: "users").child(String(user.uid)).child("tasks")
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
            
            let task = Task(title: textField.text!, userId: (self?.user.uid)!)
            let taskRef = self?.ref.child(task.title.lowercased())
            taskRef?.setValue(task.convertToDictionary())
            
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
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task = tasks[indexPath.row]
            task.ref?.removeValue()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        let task = tasks[indexPath.row]
        let isCompleted = !task.completed
        
        toggleCompleted(cell, isCompleted: isCompleted)
        task.ref?.updateChildValues(["completed": isCompleted])
    }
    
    func toggleCompleted(_ cell: UITableViewCell, isCompleted: Bool) {
        cell.accessoryType = isCompleted ? .checkmark : .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Helper.String.cellKey, for: indexPath) as! TableViewCell
        cell.label.customLabel.text = tasks[indexPath.row].title
        
        let isCompleted = tasks[indexPath.row].completed
        toggleCompleted(cell, isCompleted: isCompleted)
        return cell
    }
    
    
}
