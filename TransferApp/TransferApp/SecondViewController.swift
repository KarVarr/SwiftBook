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
    var handleUpdatedDataDelegate: DataUpdateProtocol?
    
    
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toFirstScreen": prepareFirstScreen(segue)
        default: break
        }
    }
    
    private func prepareFirstScreen(_ segue: UIStoryboardSegue) {
        guard let destinationController = segue.destination as? ViewController else { return }
        destinationController.updatedData = dataTextField.text ?? ""
    }
    
    
    @IBAction func saveDataWithProperty(_ sender: UIButton) { navigationController?.viewControllers.forEach { viewController in (viewController as? ViewController)?.updatedData = dataTextField.text ?? ""
        }
    }
    
    @IBAction func saveDataWithDelegate (_ sender: UIButton) {
        let updatedData = dataTextField.text ?? ""
        handleUpdatedDataDelegate?.onDataUpdate(data: updatedData)
        navigationController?.popViewController(animated: true)
    }
}
