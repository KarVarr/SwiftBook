//
//  TableViewController.swift
//  ToDoList
//
//  Created by Karen Vardanian on 30.08.2023.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    var tasks: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let context = getContext()
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        
        do {
           tasks = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func deleteTasks(_ sender: UIBarButtonItem) {
        let context = getContext()
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        
        if let objects = try? context.fetch(fetchRequest) {
            for obj in objects {
                context.delete(obj)
            }
        }
        
        do {
            try context.save()
            tasks.removeAll()
            tableView.reloadData()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    @IBAction func saveTask(_ sender: UIBarButtonItem) {
        let ac = UIAlertController(title: "New task", message: "Please add new task", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) {[unowned self] action in
            let tf = ac.textFields?.first
            if let newTask = tf?.text {
                self.saveTaskCD(withTitle: newTask)
                self.tableView.reloadData()
            }
        }
        ac.addTextField{ text in
            text.placeholder = "Write something here"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        ac.addAction(cancelAction)
        ac.addAction(saveAction)
        present(ac, animated: true)
    }
    
    private func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        return context
    }
    
    private func saveTaskCD(withTitle title: String) {
       let context = getContext()
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Task", in: context) else { return }
        
        let taskObject = Task(entity: entity, insertInto: context)
        taskObject.title = title
        
        do {
            try context.save()
            tasks.append(taskObject)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.title
        
        return cell
    }
    
    
    
    
}
