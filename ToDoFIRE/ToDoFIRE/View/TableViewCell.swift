//
//  TableViewCell.swift
//  ToDoFIRE
//
//  Created by Karen Vardanian on 19.07.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    let label = LabelView()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init coder: has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: Helper.String.cellKey)
        
        addView()
        setting()
        layout()
    }
    
    func addView() {
        contentView.addSubview(label.customLabel)
    }
    
    func setting() {
        label.customLabel.textColor = .black
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            label.customLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            label.customLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
}
