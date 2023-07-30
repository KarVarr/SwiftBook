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
    var pri: Price?
    
    let customTable = TableViewView()
    let array = [Int]()
    let url = "http://data.fixer.io/api/latest"
    let key = "a95f5542d5ed32ef80d6fec5f2694f09"
    let base = "EUR"
    let symbols = "USD, RUB"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let param = ["access_key": key, "base": base, "symbols": symbols]
        
        addView()
        settings()
        layout()
        
        getPrice(url: url, parameters: param) { [weak self] result in
            switch result {
            case .success(let price):
                self?.pri = Price(title: price.title, data: price.data)
            case .failure(let error):
                print("Error fetching data: \(error)")
            }
        }
        
        print(pri?.title)
    }
    
    func getPrice(url: String, parameters: [String: String], completion: @escaping (Result<Price, Error>) -> Void) {
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            switch response.result {
            case .success(let value):
                print(value)
                if let json = value as? [String: Any],
                   let title = json["base"] as? String,
                   let date = json["date"] as? String {
                    let price = Price(title: title, data: date)
                    completion(.success(price))
                }
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    
    
    //MARK: - Settings
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
