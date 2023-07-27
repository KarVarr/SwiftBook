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
    
    weak var viewModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            fullNameLabel.customLabel.text = viewModel.fullName
            ageLabel.customLabel.text = viewModel.age
        }
    }
    
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
