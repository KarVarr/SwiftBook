//
//  SecondViewController.swift
//  GCD
//
//  Created by Karen Vardanian on 27.06.2023.
//

import UIKit

class SecondViewController: UIViewController {
    let mainImage = ImageView()
    
    fileprivate var imageURL: URL?
    fileprivate var image: UIImage? {
        get {
            return mainImage.customImage.image
        }
        
        set {
            mainImage.customImage.image = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        settings()
        layout()
        
        fetchImage()
    }
    
    func addView() {
        view.addSubview(mainImage.customImage)
    }
    
    func settings() {
        title = "SecondVC"
        
        view.backgroundColor = .white
        
        navigationItem.largeTitleDisplayMode = .never
        
       
    }
    
    func layout() {
        let image = mainImage.customImage
        
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            image.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
        ])
    }
    
    fileprivate func fetchImage() {
        imageURL = URL(string: "https://images.hdqwalls.com/wallpapers/moon-astrophotography-4k-sc.jpg")
        guard let url = imageURL, let imageData = try? Data(contentsOf: url) else { return }
        self.image = UIImage(data: imageData)
    }
    
    
    
}
