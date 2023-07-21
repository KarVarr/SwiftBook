//
//  ViewController.swift
//  ToDoFIRE
//
//  Created by Karen Vardanian on 19.07.2023.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    private let tasksVC = TasksViewController()
    
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
        
        Auth.auth().addStateDidChangeListener { [weak self] auth, user in
            if let navigationController = self?.navigationController {
                navigationController.pushViewController(self!.tasksVC, animated: true)
                return
            }
        }
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
        
        emailTextField.customTextFieldView.text = ""
        passwordTextField.customTextFieldView.text = ""
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    
    
    
    //MARK: - Functions
    
    func displayWarningLabel(withText text: String) {
        subTitleLabel.customLabel.text = text
        
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: { [weak self] in
            self?.subTitleLabel.customLabel.alpha = 1
        }) { [weak self] complete in
            self?.subTitleLabel.customLabel.alpha = 0
        }
    }
    
    @objc func loginButtonTapped() {
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
                    navigationController.pushViewController(self!.tasksVC, animated: true)
                    return
                }
            }
            
            self?.displayWarningLabel(withText: "No such user")
        }
    }
    
    
    @objc func registerButtonTapped() {
        guard let email = emailTextField.customTextFieldView.text, let password = passwordTextField.customTextFieldView.text, email != "", password != "" else {
            displayWarningLabel(withText: "Info is incorrect")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] user, error in
            if error == nil {
                if user != nil {
                    
                } else {
                    let ac = UIAlertController(title: "Error", message: "User is not created", preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "OK", style: .default))
                    self?.present(ac, animated: true)
                    
                    print("User is not created")
                }
            } else {
                print(error?.localizedDescription ?? "error")
            }
        }
    }
    
    
}

