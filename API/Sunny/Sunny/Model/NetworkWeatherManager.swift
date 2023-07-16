//
//  NetworkWeatherManager.swift
//  Sunny
//
//  Created by Karen Vardanian on 16.07.2023.
//

import Foundation

class NetworkWeatherManager {
    func fetchCurrentWeather() {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=Yerevan&appid=aed181e6001b18bf65079ed785ac0dfe"
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                let dataString = String(data: data, encoding: .utf8)
                print(dataString!)
            }
        }
        task.resume()
    }
}
