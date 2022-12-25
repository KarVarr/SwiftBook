//
//  ViewController.swift
//  UITextView
//
//  Created by Karen Vardanian on 25.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var textViewBottonConstrain: NSLayoutConstraint!
    
    @IBOutlet weak var stepper: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
        
        textView.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 17)
        textView.backgroundColor = self.view.backgroundColor
        textView.layer.cornerRadius = 10
        
        stepper.value = 17
        stepper.minimumValue = 10
        stepper.maximumValue = 25
        
        stepper.tintColor = .white
        stepper.backgroundColor = .brown
        stepper.layer.cornerRadius = 10
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateTextView(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateTextView(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        
        countLabel.text = "\(textView.text.count)"
        
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true) //hide the keybord
    }
    
    @objc func updateTextView(notification: Notification) {
        guard let userInfo = notification.userInfo as? [String: Any],
              let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        else { return }
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            textView.contentInset = UIEdgeInsets.zero
        } else {
            textView.contentInset = UIEdgeInsets(top: 0,
                                                 left: 0,
                                                 bottom: keyboardFrame.height - textViewBottonConstrain.constant,
                                                 right: 0)
            textView.scrollIndicatorInsets = textView.contentInset
        }
        
        textView.scrollRangeToVisible(textView.selectedRange)
    }
    
    
    @IBAction func sizeFont(_ sender: UIStepper) {
        let font = textView.font?.fontName
        let fontSize = CGFloat(sender.value)
        
        textView.font = UIFont(name: font!, size: fontSize)
    }
    
    //MARK: - You can put func here, if you want
    //    func textViewDidBeginEditing(_ textView: UITextView) {
    //        textView.backgroundColor = .white
    //        textView.textColor = .green
    //    }
    //
    //    func textViewDidEndEditing(_ textView: UITextView) {
    //        textView.backgroundColor = self.view.backgroundColor
    //        textView.textColor = .black
    //    }
    
    
}

extension ViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.backgroundColor = .white
        textView.textColor = .green
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.backgroundColor = self.view.backgroundColor
        textView.textColor = .black
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        countLabel.text = "\(textView.text.count)"
        return textView.text.count + (text.count - range.length) <= 2123
    }
    
    
}

