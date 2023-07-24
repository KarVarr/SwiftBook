//
//  TableVCCell.swift
//  MVC-N
//
//  Created by Karen Vardanian on 24.07.2023.
//

import UIKit
import SnapKit

class TableVCCell: UITableViewCell {
    let label = LabelView()
    let textV = TextView()
    
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
        super.init(style: style, reuseIdentifier: "Cell")
        
        addView()
        setting()
        layout()
    }
    
    func addView() {
        contentView.addSubview(label.label)
        contentView.addSubview(textV.text)
    }
    
    func setting() {
        
    }
    
    func layout() {
        label.label.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-16)
        }
        
        textV.text.snp.makeConstraints { make in
            make.top.equalTo(label.label.snp_bottomMargin).offset(8)
            make.left.equalTo(label.label)
            make.right.equalTo(label.label)
            make.bottom.equalToSuperview().offset(-8)
        }
    }
}
