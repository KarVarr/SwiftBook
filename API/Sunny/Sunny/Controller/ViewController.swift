//
//  ViewController.swift
//  Sunny
//
//  Created by Karen Vardanian on 15.07.2023.
//

import UIKit

class ViewController: UIViewController {
    let city = Cities.shared
    
    let weatherIconImageView = ImageView()
    let cityLabel = LabelView()
    let temperatureLabel = LabelView()
    let feelsLikeTemperatureLabel = LabelView()
    let searchButton = ButtonView()
    
    let verticalStackView = StackView()
    let horizontalStackView = StackView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addViews()
        settings()
        layout()
    }
    
    func addViews() {
        view.addSubview(verticalStackView.customStackView)
        verticalStackView.customStackView.addArrangedSubview(weatherIconImageView.customImage)
        verticalStackView.customStackView.addArrangedSubview(temperatureLabel.customLabel)
        verticalStackView.customStackView.addArrangedSubview(feelsLikeTemperatureLabel.customLabel)
        
        view.addSubview(horizontalStackView.customStackView)
        horizontalStackView.customStackView.addArrangedSubview(cityLabel.customLabel)
        horizontalStackView.customStackView.addArrangedSubview(searchButton.customButton)

    }
    
    func settings() {
        verticalStackView.customStackView.axis = .vertical
        verticalStackView.customStackView.alignment = .center
        verticalStackView.customStackView.spacing = 30
        
        horizontalStackView.customStackView.axis = .horizontal
        horizontalStackView.customStackView.alignment = .center
        horizontalStackView.customStackView.spacing = 10
        
        
        weatherIconImageView.customImage.image = UIImage(systemName: "sun.min")
        
        temperatureLabel.customLabel.text = "25 C"
        temperatureLabel.customLabel.textColor = .gray
        temperatureLabel.customLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 64)
        
        feelsLikeTemperatureLabel.customLabel.text = "Feels like 27 C"
        feelsLikeTemperatureLabel.customLabel.textColor = .lightGray
        feelsLikeTemperatureLabel.customLabel.font = UIFont(name: "AppleSDGothicNeo-Light", size: 24)
        
        cityLabel.customLabel.text = city.allCities.randomElement()
    }
    
    func layout() {
        let vStack = verticalStackView.customStackView
        let hStack = horizontalStackView.customStackView
        
        
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            
            hStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            hStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            
        ])
    }


}

