//
//  SecondViewController.swift
//  Right on target
//
//  Created by Karen Vardanian on 21.08.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
        
    override func loadView() {
        super.loadView()
        print("loadView SecondViewController")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad SecondViewController")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear SecondViewController")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("viewWillLayoutSubviews SecondViewController")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("viewDidLayoutSubviews SecondViewController")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear SecondViewController")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear SecondViewController")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear SecondViewController")
    }
    
    deinit {
        print("deinit")
    }
    
    @IBAction func hideCurrentScene() {
        dismiss(animated: true)
    }
  

}
