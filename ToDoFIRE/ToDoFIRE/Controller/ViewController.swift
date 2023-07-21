//
//  ViewController.swift
//  ToDoFIRE
//
//  Created by Karen Vardanian on 19.07.2023.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    let stackViewMain = StackView()
    
    let titleLabel = LabelView()
    let subTitleLabel = LabelView()
    let stackViewForLabels = StackView()
    
    let emailTextField = TextFieldView()
    let passwordTextField = TextFieldView()
    let stackViewForTextField = StackView()
    
    let loginButton = ButtonView()
    let registerButton = ButtonView()
    let stackViewForButtons = StackView()
    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        settings()
        settingsForLabels()
        settingsForTextFields()
        settingsForButtons()
        layout()
    }
    
    //MARK: - ViewWillDisappear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: - ViewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    
    
    //MARK: - Functions
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardHeight = keyboardFrame.cgRectValue.height
            
            UIView.animate(withDuration: 0.3) {
                self.view.transform = CGAffineTransform(translationX: 0, y: -keyboardHeight / 2)
            }
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        UIView.animate(withDuration: 0.3) {
            self.view.transform = .identity
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            passwordTextField.customTextFieldView.becomeFirstResponder()
        } else if textField.tag == 1 {
            textField.resignFirstResponder()
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func addLeftView(to textField: UITextField, width: CGFloat) {
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 1))
        textField.leftView = leftView
        textField.leftViewMode = .always
    }
    
    
    func stackViewSetting(forStackView stackView: UIStackView, withSpacing space: CGFloat) {
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = space
        stackView.distribution = .fillEqually
    }
    
    func displayWarningLabel(withText text: String) {
        subTitleLabel.customLabel.text = text
        
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: { [weak self] in
            self?.subTitleLabel.customLabel.alpha = 1
        }) { [weak self] complete in
            self?.subTitleLabel.customLabel.alpha = 0
        }
        
        subTitleLabel.customLabel.alpha = 0
    }
    
    @objc func loginButtonTapped() {
        let tasksVC = TasksViewController()
        
        
        guard let email = emailTextField.customTextFieldView.text, let password = passwordTextField.customTextFieldView.text, email != "", password != "" else {
            displayWarningLabel(withText: "Info is incorrect")
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
            if error != nil {
                self?.displayWarningLabel(withText: "Error occurred")
                return
            }
            
            if user != nil {
                if let navigationController = self?.navigationController {
                    navigationController.pushViewController(tasksVC, animated: true)
                    return
                }
            }
            
            self?.displayWarningLabel(withText: "No such user")
        }
    }
    
    
}

