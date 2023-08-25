//
//  ViewController.swift
//  TransferApp
//
//  Created by Karen Vardanian on 24.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dataLabel: UILabel!
    
    var updatedData: String = "Test data"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLabel(withText: updatedData)
    }
    
    private func updateLabel(withText text: String) {
        dataLabel.text = updatedData
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toEditScreen": prepareEditScreen(segue)
        default: break
        }
    }
    
    private func prepareEditScreen(_ segue: UIStoryboardSegue) {
        guard let destinationController = segue.destination as? SecondViewController else { return }
        destinationController.updatingData = dataLabel.text ?? ""
    }
    
    
    @IBAction func editDataWithProperty(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let editScreen = storyboard.instantiateViewController(withIdentifier:"SecondViewController") as! UpdatingDataController
        
        editScreen.updatingData = dataLabel.text ?? ""
        
        navigationController?.pushViewController(editScreen as! UIViewController, animated: true)
    }
}

