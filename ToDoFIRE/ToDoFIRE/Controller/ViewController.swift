//
//  ViewController.swift
//  ToDoFIRE
//
//  Created by Karen Vardanian on 19.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let titleLabel = LabelView()
    let subTitle = LabelView()
    let stackViewForLabels = StackView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        addViews()
        settings()
        settingsForLabels()
        layout()
    }
    
    
    func addViews() {
        view.addSubview(stackViewForLabels.customStack)
        stackViewForLabels.customStack.addArrangedSubview(titleLabel.customLabel)
        stackViewForLabels.customStack.addArrangedSubview(subTitle.customLabel)
        

    }
    
    func settings() {
        view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        
        stackViewForLabels.customStack.axis = .vertical
        stackViewForLabels.customStack.alignment = .center
        stackViewForLabels.customStack.spacing = 10
    }
    
    func settingsForLabels() {
        titleLabel.customLabel.text = Helper.String.title
        titleLabel.customLabel.font = Helper.Fonts.TamilSangamMN(withSize: 40)
        
        subTitle.customLabel.text = Helper.String.subtitle
        subTitle.customLabel.font = Helper.Fonts.TamilSangamMN(withSize: 18)
    }
    
    func layout() {
        let stackViewForLabels = stackViewForLabels.customStack
        
        NSLayoutConstraint.activate([
            stackViewForLabels.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            stackViewForLabels.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
    }


}

