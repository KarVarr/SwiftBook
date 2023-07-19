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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        addViews()
        settings()
        settingsForLabels()
        settingsForTextFields()
        settingsForButtons()
        layout()
    }
    
    
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
        view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        
        
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
        emailTextField.customTextFieldView.layer.cornerRadius = 5
        
        passwordTextField.customTextFieldView.placeholder = Helper.String.password
        passwordTextField.customTextFieldView.layer.cornerRadius = 5
        passwordTextField.customTextFieldView.isSecureTextEntry = true
    }
    
    func settingsForButtons() {
        loginButton.customButton.backgroundColor = .white.withAlphaComponent(0.2)
        loginButton.customButton.setTitle(Helper.String.login, for: .normal)
        loginButton.customButton.titleLabel?.font = Helper.Fonts.TamilSangamMN(withSize: 24)
        loginButton.customButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        
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

