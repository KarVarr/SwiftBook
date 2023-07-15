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
    
    let verticalStackView = StackView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        addViews()
        settings()
        layout()
    }
    
    func addViews() {
        view.addSubview(cityLabel.customLabel)
        view.addSubview(verticalStackView.customStackView)
        verticalStackView.customStackView.addArrangedSubview(weatherIconImageView.customImage)
        verticalStackView.customStackView.addArrangedSubview(temperatureLabel.customLabel)
        verticalStackView.customStackView.addArrangedSubview(feelsLikeTemperatureLabel.customLabel)

    }
    
    func settings() {
        verticalStackView.customStackView.axis = .vertical
        verticalStackView.customStackView.alignment = .center
        
        weatherIconImageView.customImage.image = UIImage(systemName: "sun.min")
        temperatureLabel.customLabel.text = "25 C"
        feelsLikeTemperatureLabel.customLabel.text = "Feels like 27 C"
        cityLabel.customLabel.text = city.allCities.randomElement()
    }
    
    func layout() {
        let vStack = verticalStackView.customStackView
        let city = cityLabel.customLabel
        
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            city.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            city.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }


}

