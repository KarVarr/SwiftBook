//
//  ViewController.swift
//  MVVM
//
//  Created by Karen Vardanian on 25.07.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let verticalStackView = StackView()
    
    let nameLabel = LabelView()
    let secondNameLabel = LabelView()
    let ageLabel = LabelView()
    
    var viewModel: ViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            
            self.nameLabel.customLabel.text = viewModel.name
            self.secondNameLabel.customLabel.text = viewModel.secondName
            self.ageLabel.customLabel.text = String(viewModel.age)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        settings()
        stackSettings()
        layout()
        
        viewModel = ViewModel()
    }
    
    private func addViews() {
        view.addSubview(verticalStackView.customStackView)
        verticalStackView.customStackView.addArrangedSubview(nameLabel.customLabel)
        verticalStackView.customStackView.addArrangedSubview(secondNameLabel.customLabel)
        verticalStackView.customStackView.addArrangedSubview(ageLabel.customLabel)
    }
    
    private func settings() {
        view.backgroundColor = .orange
    }
    
    private func stackSettings() {
        verticalStackView.customStackView.axis = .vertical
        verticalStackView.customStackView.alignment = .center
        verticalStackView.customStackView.spacing = 20
        verticalStackView.customStackView.distribution = .fillEqually
        verticalStackView.customStackView.layer.borderColor = UIColor.black.cgColor
        verticalStackView.customStackView.layer.borderWidth = 5
    }
    
    private func layout() {
        verticalStackView.customStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.bottom.equalToSuperview().offset(-150)
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
        }
    }


}

