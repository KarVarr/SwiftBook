//
//  SecondViewController.swift
//  TransferApp
//
//  Created by Karen Vardanian on 24.08.2023.
//

import UIKit

protocol UpdatingDataController: AnyObject {
    var updatingData: String { get set }
}

class SecondViewController: UIViewController, UpdatingDataController {
    
    @IBOutlet weak var dataTextField: UITextField!
    
    var updatingData: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTextFieldData(withText: updatingData)
    }
    
    private func updateTextFieldData(withText text: String) {
        dataTextField.text = text
    }
    
    @IBAction func saveDataWithProperty(_ sender: UIButton) { navigationController?.viewControllers.forEach { viewController in (viewController as? ViewController)?.updatedData = dataTextField.text ?? ""
    }
    }
}
