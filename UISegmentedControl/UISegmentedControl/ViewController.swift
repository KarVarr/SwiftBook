//
//  ViewController.swift
//  UISegmentedControl
//
//  Created by Karen Vardanian on 21.12.2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.value = 1
        
        label.text = String(slider.value)
        label.font = label.font.withSize(35)
        label.textAlignment = .center
        label.numberOfLines = 4
        
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: true)
        
        slider.minimumValue = 0.1
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .tintColor
        slider.maximumTrackTintColor = .purple
        slider.thumbTintColor = .cyan
        
    }

    @IBAction func choiceSegment(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            label.text = "The First Segment Selected"
            label.textColor = .red
        case 1:
            label.text = "The Second Segment Selected"
            label.textColor = .green
        case 2:
            label.text = "The Third Segment Selected"
            label.textColor = .blue
            
            
            
        default:
            label.text = "Error, try again leter!!!"
        }
        
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        label.text = String(format: "%.1f", slider.value)
        
        let viewBackground = self.view.backgroundColor
        self.view.backgroundColor = viewBackground?.withAlphaComponent(CGFloat(sender.value))
    }
}

