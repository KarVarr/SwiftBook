//
//  ViewController.swift
//  ImageFromNet
//
//  Created by Karen Vardanian on 29.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicator.isHidden = true
        indicator.hidesWhenStopped = true
    }
    
    @IBAction func ButtonPressed(_ sender: UIButton) {
        indicator.isHidden = false
        indicator.startAnimating()
        button.isHidden = true
        
        guard let url = URL(string: "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80") else { return }
        
        let session = URLSession.shared
        
        session.dataTask(with: url) { [weak self] data, response, error in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.indicator.stopAnimating()
                    
                    self?.imageView.image = image
                }
            }
        }.resume()
        
    }
    
}

