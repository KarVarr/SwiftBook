//
//  SecondViewController.swift
//  GCD
//
//  Created by Karen Vardanian on 27.06.2023.
//

import UIKit

class SecondViewController: UIViewController {
    let mainImage = ImageView()
    let activityIndicator = ActivityIndicatorView()
    
    fileprivate var imageURL: URL?
    fileprivate var image: UIImage? {
        get {
            return mainImage.customImage.image
        }
        
        set {
            activityIndicator.indicator.stopAnimating()
            activityIndicator.indicator.isHidden = true
            mainImage.customImage.image = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        settings()
        layout()
        
        fetchImage()
        delay(3) {
            self.loginAlert()
        }
    }
    
    func addView() {
        view.addSubview(mainImage.customImage)
        view.addSubview(activityIndicator.indicator)
    }
    
    func settings() {
        title = "SecondVC"
        
        view.backgroundColor = .white
        
        navigationItem.largeTitleDisplayMode = .never
        
       
    }
    
    func layout() {
        let image = mainImage.customImage
        let indicator = activityIndicator.indicator
        
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            image.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            
            indicator.centerXAnchor.constraint(equalTo: image.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: image.centerYAnchor),
        ])
    }
    
    fileprivate func delay(_ delay: Int, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay)) {
            closure()
        }
        
    }
    
    fileprivate func loginAlert() {
        let ac = UIAlertController(title: "Registered?" , message: "Enter your username and password", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        ac.addAction(okAction)
        ac.addAction(cancelAction)
        
        ac.addTextField { (usernameTF) in
            usernameTF.placeholder = "Enter username"
        }
        
        ac.addTextField { (userPasswordTF) in
            userPasswordTF.placeholder = "Enter password"
            userPasswordTF.isSecureTextEntry = true
        }
        
        present(ac, animated: true)
    }
    
    fileprivate func fetchImage() {
        imageURL = URL(string: "https://free4kwallpapers.com/uploads/originals/2022/04/20/rubiks-cube-digital-art-wallpaper.jpg")
        activityIndicator.indicator.isHidden = false
        activityIndicator.indicator.startAnimating()
        
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            guard let url = self.imageURL, let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: imageData)
            }
            
        }
    }
    
    
    
}
