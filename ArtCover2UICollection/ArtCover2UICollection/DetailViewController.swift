//
//  DetailViewController.swift
//  ArtCover2UICollection
//
//  Created by Karen Vardanian on 28.12.2022.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelView: UILabel!
    
    var nameOfImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelView.text = nameOfImage
        imageView.image = UIImage(named: nameOfImage)
        
    }
    

   

}
