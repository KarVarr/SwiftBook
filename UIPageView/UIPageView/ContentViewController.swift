//
//  ContentViewController.swift
//  UIPageView
//
//  Created by Karen Vardanian on 01.01.2023.
//

import UIKit

class ContentViewController: UIViewController {
    
    @IBOutlet weak var presentTextLabel: UILabel!
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var presentText = ""
    var emoji = ""
    var currentPage = 0
    var numberOfPages = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       
        
        
        presentTextLabel.text = presentText
        emojiLabel.text = emoji
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPage = currentPage
    }
    
    
    
    
}
