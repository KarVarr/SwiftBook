//
//  ViewController.swift
//  Sunny
//
//  Created by Karen Vardanian on 15.07.2023.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    let city = Cities.shared
    var networkWeatherManager = NetworkWeatherManager()
    
    lazy var cllocationView = CLLocationView()
    let backgroundImageView = ImageView()
    let weatherIconImageView = ImageView()
    let cityLabel = LabelView()
    let temperatureLabel = LabelView()
    let feelsLikeTemperatureLabel = LabelView()
    let searchButton = ButtonView()
    
    let verticalStackView = StackView()
    let horizontalStackView = StackView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        networkWeatherManager.onCompletion = { [weak self] currentWeather in
            guard let self = self else { return }
            self.updateInterfaceWith(weather: currentWeather)
        }
        
        location()
        addViews()
        settings()
        layout()
    }
    
    //MARK: - Functions
    
    func location() {
        cllocationView.locationManager.delegate = self
        
        if CLLocationManager.locationServicesEnabled() {
            cllocationView.locationManager.requestLocation()
        }
    }
    
    func addViews() {
        view.addSubview(backgroundImageView.customImage)
        
        view.addSubview(verticalStackView.customStackView)
        verticalStackView.customStackView.addArrangedSubview(weatherIconImageView.customImage)
        verticalStackView.customStackView.addArrangedSubview(temperatureLabel.customLabel)
        verticalStackView.customStackView.addArrangedSubview(feelsLikeTemperatureLabel.customLabel)
        
        view.addSubview(horizontalStackView.customStackView)
        horizontalStackView.customStackView.addArrangedSubview(cityLabel.customLabel)
        horizontalStackView.customStackView.addArrangedSubview(searchButton.customButton)
        
    }
    
    func settings() {
        backgroundImageView.customImage.image = UIImage(named: "weather")
        
        verticalStackView.customStackView.axis = .vertical
        verticalStackView.customStackView.alignment = .center
        verticalStackView.customStackView.spacing = 20
        
        horizontalStackView.customStackView.axis = .horizontal
        horizontalStackView.customStackView.alignment = .center
        horizontalStackView.customStackView.spacing = 10
        
        
        weatherIconImageView.customImage.image = UIImage(systemName: "sun.min")
        weatherIconImageView.customImage.tintColor = .white
        
        temperatureLabel.customLabel.text = "25 C"
        temperatureLabel.customLabel.textColor = .white
        temperatureLabel.customLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 74)
        
        feelsLikeTemperatureLabel.customLabel.text = "Feels like 27 C"
        feelsLikeTemperatureLabel.customLabel.textColor = .white.withAlphaComponent(0.8)
        feelsLikeTemperatureLabel.customLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 28)
        
        cityLabel.customLabel.text = city.allCities.randomElement()
        cityLabel.customLabel.textColor = .white
        
        searchButton.customButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    func layout() {
        let backImage = backgroundImageView.customImage
        let vStack = verticalStackView.customStackView
        let hStack = horizontalStackView.customStackView
        
        
        NSLayoutConstraint.activate([
            backImage.topAnchor.constraint(equalTo: view.topAnchor),
            backImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            vStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            
            hStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            hStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            
        ])
    }
    
    @objc func buttonPressed() {
        presentSearchAlertController(withTitle: "Enter the name of the city", message: nil, style: .alert) { [unowned self] city in
            self.networkWeatherManager.fetchCurrentWeather(forRequestType: .cityName(city: city))
        }
    }
    
    func updateInterfaceWith(weather: CurrentWeather) {
        DispatchQueue.main.async {
            self.cityLabel.customLabel.text = weather.cityName
            self.temperatureLabel.customLabel.text = weather.temperatureString
            self.feelsLikeTemperatureLabel.customLabel.text = weather.feelsLikeTemperatureString
            self.weatherIconImageView.customImage.image = UIImage(systemName: weather.systemIconWeather)
        }
    }
    
    
    
}



extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        
        networkWeatherManager.fetchCurrentWeather(forRequestType: .coordinate(latitude: latitude, longitude: longitude))
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}

