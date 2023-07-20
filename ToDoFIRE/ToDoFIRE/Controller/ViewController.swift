//
//  ViewController.swift
//  ToDoFIRE
//
//  Created by Karen Vardanian on 19.07.2023.
//

import UIKit

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
    
    
    //MARK: - VDL Section
    
    func addViews() {
        view.addSubview(stackViewForLabels.customStack)
        stackViewForLabels.customStack.addArrangedSubview(titleLabel.customLabel)
        stackViewForLabels.customStack.addArrangedSubview(subTitleLabel.customLabel)
        
        view.addSubview(stackViewForTextField.customStack)
        stackViewForTextField.customStack.addArrangedSubview(emailTextField.customTextFieldView)
        stackViewForTextField.customStack.addArrangedSubview(passwordTextField.customTextFieldView)
        
        view.addSubview(stackViewForButtons.customStack)
        stackViewForButtons.customStack.addArrangedSubview(loginButton.customButton)
        stackViewForButtons.customStack.addArrangedSubview(registerButton.customButton)
        
    }
    
    func settings() {
        view.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        
        
        stackViewSetting(forStackView: stackViewForLabels.customStack, withSpacing: 10)
        stackViewSetting(forStackView: stackViewForTextField.customStack, withSpacing: 20)
        stackViewSetting(forStackView: stackViewForButtons.customStack, withSpacing: 20)
    }
    
    func settingsForLabels() {
        titleLabel.customLabel.text = Helper.String.title
        titleLabel.customLabel.font = Helper.Fonts.TamilSangamMN(withSize: 40)
        
        subTitleLabel.customLabel.text = Helper.String.subtitle
        subTitleLabel.customLabel.font = Helper.Fonts.TamilSangamMN(withSize: 18)
    }
    
    func settingsForTextFields() {
        emailTextField.customTextFieldView.placeholder = Helper.String.email
        emailTextField.customTextFieldView.layer.cornerRadius = 20
        emailTextField.customTextFieldView.delegate = self
        emailTextField.customTextFieldView.tag = 0
        
        passwordTextField.customTextFieldView.placeholder = Helper.String.password
        passwordTextField.customTextFieldView.layer.cornerRadius = 20
        passwordTextField.customTextFieldView.isSecureTextEntry = true
        passwordTextField.customTextFieldView.delegate = self
        passwordTextField.customTextFieldView.tag = 1
        
        addLeftView(to: emailTextField.customTextFieldView, width: 20)
        addLeftView(to: passwordTextField.customTextFieldView, width: 20)
    }
    
    func settingsForButtons() {
        loginButton.customButton.backgroundColor = .white.withAlphaComponent(0.2)
        loginButton.customButton.setTitle(Helper.String.login, for: .normal)
        loginButton.customButton.titleLabel?.font = Helper.Fonts.TamilSangamMN(withSize: 24)
        loginButton.customButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginButton.customButton.layer.cornerRadius = 20
        
        registerButton.customButton.titleLabel?.font = Helper.Fonts.TamilSangamMN(withSize: 16)
        registerButton.customButton.setTitle(Helper.String.register, for: .normal)
        
    }
    
    func layout() {
        let stackViewForLabels = stackViewForLabels.customStack
        let stackViewForTextField = stackViewForTextField.customStack
        let stackViewForButtons = stackViewForButtons.customStack
        
        NSLayoutConstraint.activate([
            
            stackViewForLabels.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            stackViewForLabels.heightAnchor.constraint(equalToConstant: 100),
            stackViewForLabels.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackViewForTextField.topAnchor.constraint(equalTo: stackViewForLabels.bottomAnchor, constant: 50),
            stackViewForTextField.heightAnchor.constraint(equalToConstant: 100),
            stackViewForTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.customTextFieldView.widthAnchor.constraint(greaterThanOrEqualToConstant: 250),
            passwordTextField.customTextFieldView.widthAnchor.constraint(greaterThanOrEqualToConstant: 250),
            
            stackViewForButtons.topAnchor.constraint(equalTo: stackViewForTextField.bottomAnchor, constant: 50),
            stackViewForButtons.heightAnchor.constraint(equalToConstant: 100),
            stackViewForButtons.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.customButton.widthAnchor.constraint(equalToConstant: 150),
            registerButton.customButton.widthAnchor.constraint(equalToConstant: 150),
            
        ])
        
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
    
    @objc func loginButtonTapped() {
        let tasksVC = TasksViewController()
        
        if let navigationController = self.navigationController {
            navigationController.pushViewController(tasksVC, animated: true)
        }
    }
    
    
}

