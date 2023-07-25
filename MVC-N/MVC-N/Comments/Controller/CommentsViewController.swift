//
//  CommentsViewController.swift
//  MVC-N
//
//  Created by Karen Vardanian on 24.07.2023.
//

import UIKit
import SnapKit

class CommentsViewController: UIViewController {
    let tableVC = TableVC()
    var comments = [Comment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        addView()
        settingsForTableVC()
        settings()
        layout()
        
        CommentNetworkService.getComments { response in
            self.comments = response.comments
            self.tableVC.table.reloadData()
        }
        
    }
    
    private func addView() {
        view.addSubview(tableVC.table)
    }
    
    private func settingsForTableVC() {
        tableVC.table.register(TableVCCell.self, forCellReuseIdentifier: "Cell")
        tableVC.table.delegate = self
        tableVC.table.dataSource = self
        
    }
    
    private func settings() {
        view.backgroundColor = .orange
        title = "MVC-N"
    }
    
    private func layout() {
        tableVC.table.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
}

extension CommentsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableVCCell
        let comment = comments[indexPath.row]
        cell.configure(with: comment)
        return cell
    }
    
    
}

