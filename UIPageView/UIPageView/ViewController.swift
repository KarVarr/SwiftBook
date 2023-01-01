//
//  ViewController.swift
//  UIPageView
//
//  Created by Karen Vardanian on 01.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startPresentation()
    }

    func startPresentation () {
        let userDefault = UserDefaults.standard
        let presentationWasViewed = userDefault.bool(forKey: "Done")
        if presentationWasViewed == false {
            
            if let pageViewController = storyboard?.instantiateViewController(withIdentifier: "PageViewController") as? PageViewController {
                present(pageViewController, animated: true)
            }
        }
        
    }

}

