//
//  DetailVC.swift
//  ArtCover
//
//  Created by Karen Vardanian on 27.12.2022.
//

import UIKit

class DetailVC: UIViewController {

    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var trackTitle = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        image.image = UIImage(named: trackTitle)
        label.text = trackTitle
        label.numberOfLines = 0
        
    }
    


}
