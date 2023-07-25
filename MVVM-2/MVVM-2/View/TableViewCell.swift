//
//  TableViewCell.swift
//  MVVM-2
//
//  Created by Karen Vardanian on 25.07.2023.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    let fullNameLabel = LabelView()
    let ageLabel = LabelView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "Cell")
        
        addView()
        setting()
        layout()
    }
    
    func addView() {
        contentView.addSubview(fullNameLabel.customLabel)
        contentView.addSubview(ageLabel.customLabel)
    }
    
    func setting() {
        fullNameLabel.customLabel.layer.borderColor = UIColor.red.cgColor
        fullNameLabel.customLabel.layer.borderWidth = 2
    }
    
    func layout() {
        fullNameLabel.customLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(ageLabel.customLabel.snp.leading).offset(-16)
        }
        
        ageLabel.customLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
            make.width.lessThanOrEqualTo(40)
        }
        
    }
    
    
    
}
