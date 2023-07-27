//
//  DetailViewController.swift
//  MVVM-2
//
//  Created by Karen Vardanian on 25.07.2023.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    let textLabel = LabelView()
    var viewModel: DetailViewModelType?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        setting()
        layout()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let viewModel = viewModel else { return }
        self.textLabel.customLabel.text = viewModel.description
    }
    
    private func addViews() {
        view.addSubview(textLabel.customLabel)
    }
    
    private func setting() {
        view.backgroundColor = .magenta
        
        viewModel?.age.bind(listener: { [unowned self] in
            guard let string = $0 else { return }
            self.textLabel.customLabel.text = string
        })
        
        delay(delay: 5) { [unowned self] in
            self.viewModel?.age.value = "Some new value"
        }
    }
    
    private func layout() {
        textLabel.customLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    private func delay(delay: Double, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + delay) {
            closure()
        }
    }
    

   

}
