//
//  ViewController.swift
//  ContactsSwiftBook
//
//  Created by Karen Vardanian on 23.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var contacts = [ContactProtocol]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loadContacts()
    }
    
    private func loadContacts() {
        contacts.append(Contact(title: "Саня Техосмотр", phone: "+799912312323"))
        contacts.append(Contact(title: "Владимир Анатольевич", phone: "+781213342321"))
        contacts.append(Contact(title: "Сильвестр", phone: "+7000911112"))
        contacts.sort{$0.title < $1.title }
    }
    
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        if let reuseCell = tableView.dequeueReusableCell(withIdentifier: "MyCell") {
            print("Используем старую ячейку для строки с индексом \(indexPath.row)")
            cell = reuseCell
        } else {
            print("Создаем новую ячейку для строки с индексом \(indexPath.row)")
            cell = UITableViewCell(style: .default, reuseIdentifier: "MyCell") }
        configure(cell: &cell, for: indexPath)
        return cell
    }
    
    private func configure(cell: inout UITableViewCell, for indexPath: IndexPath) {
        var configuration = cell.defaultContentConfiguration()
        configuration.text = contacts[indexPath.row].title
        configuration.secondaryText = contacts[indexPath.row].phone
        cell.contentConfiguration = configuration
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let actionDelete = UIContextualAction(style: .destructive, title: "Удалить") {[unowned self] _,_,_ in
            self.contacts.remove(at: indexPath.row)
            tableView.reloadData()
        }
        let actionChange = UIContextualAction(style: .normal, title: "Изменить") {[unowned self] _,_,_ in
            self.contacts.remove(at: indexPath.row)
            tableView.reloadData()
        }
        let actions = UISwipeActionsConfiguration(actions: [actionChange, actionDelete])
        return actions
    }
}

