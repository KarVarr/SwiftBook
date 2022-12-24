//
//  ViewController.swift
//  UISegmentedControl
//
//  Created by Karen Vardanian on 21.12.2022.
//

import UIKit

class ViewController: UIViewController {
    var uiElements = ["UISegmentedControl",
                      "UILabel",
                      "UISlider",
                      "UITextField",
                      "UIDatePicker",
                      "UIButton"]
    
    
    var selectedElement: String?
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var doneBotton: UIButton!
    
    
    
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
        
        datePicker.locale = Locale(identifier: "ru_RU")
        choiceUiElement()
        createToolbar()
        
    }
    
    //MARK: - FUNCTION
    func hideAllElements()  {
        segmentedControl.isHidden = true
        label.isHidden = true
        slider.isHidden = true
        doneBotton.isHidden = true
        datePicker.isHidden = true
    }
    
    
    
    func choiceUiElement() {
        let elementPicker = UIPickerView()
        elementPicker.delegate = self
        textField.inputView = elementPicker
        //Styles
        elementPicker.backgroundColor = .brown
        
    }
    
    func createToolbar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done",
                                         style: .plain,
                                         target: self,
                                         action: #selector(dismissKeyboard))
        
        toolbar.setItems([doneButton], animated: true)
        toolbar.isUserInteractionEnabled = true
        
        textField.inputAccessoryView = toolbar
        //Styles
        toolbar.barTintColor = .brown
        toolbar.tintColor = .red
    }
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
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
    
    
    @IBAction func donePressed(_ sender: UIButton) {
        
        guard textField.text?.isEmpty == false else {return}
        if let name = Double(textField.text ?? "Error") {
            print("Name format is wrong \(name)")
            let alert = UIAlertController(title: "Wrong format", message: "Please enter your name", preferredStyle: .alert)
            alert.addTextField{alertTextField in
                alertTextField.placeholder = "Enter Your Name"
                self.textField = alertTextField
            }
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
            textField.text = ""
            
            return
        } else {
            label.text = textField.text
            textField.text = ""
        }
        
        
    }
    
    
    @IBAction func changeDate(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.locale = Locale(identifier: "ru_RU")
        let dateValue = dateFormatter.string(from: sender.date)
        label.text = dateValue
        
        
    }
    @IBAction func switchAction(_ sender: UISwitch) {
        segmentedControl.isHidden = !segmentedControl.isHidden
        label.isHidden = !label.isHidden
        slider.isHidden = !slider.isHidden
        textField.isHidden = !textField.isHidden
        datePicker.isHidden = !datePicker.isHidden
        doneBotton.isHidden = !doneBotton.isHidden
        
        if sender.isOn {
            switchLabel.text = "Show All elements"
        } else {
            switchLabel.text = "Hide all elements!"
        }
    }
    
}

//MARK: - EXTENSION

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return uiElements.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return uiElements[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedElement = uiElements[row]
        textField.text = selectedElement
        label.text = textField.text
        
        switch row {
        case 0:
            hideAllElements()
            segmentedControl.isHidden = false
        case 1:
            hideAllElements()
            label.isHidden = false
        case 2:
            hideAllElements()
            slider.isHidden = false
        case 3:
            hideAllElements()
        case 4:
            hideAllElements()
            doneBotton.isHidden = false
        case 5:
            hideAllElements()
            datePicker.isHidden = false
        default:
            hideAllElements()
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerViewLabel = UILabel()
        
        if let currentLabel = view as? UILabel {
            pickerViewLabel = currentLabel
        } else {
            pickerViewLabel = UILabel()
        }
        pickerViewLabel.textColor = .white
        pickerViewLabel.textAlignment = .center
        pickerViewLabel.font  = UIFont(name: "AppleSDGothicNeo-Regular", size: 23)
        pickerViewLabel.text = uiElements[row]
        
        return pickerViewLabel
        
    }
    
}
