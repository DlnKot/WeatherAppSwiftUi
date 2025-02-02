//
//  WeatherManager.swift
//  WeApp
//
//  Created by Даниил Липленко on 02.02.2025.
//

import Foundation

final class WeatherManager {
    
    private var locationManager = LocationManager()
    private var url = URLComponents()
    
    
    func fetchWeather() {
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else { return }
        url.scheme = "https"
        url.host = "api.openweathermap.org"
        url.path = "/data/2.5/weather"
        url.queryItems = [
            URLQueryItem(name: "lat", value: locationManager.latitude.description),
            URLQueryItem(name: "lon", value: locationManager.longitude.description),
            URLQueryItem(name: "appid", value: "b1a37ce1ca53f4f82319634615c40bb4")
        ]
        
        guard let url = url.url else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8) ?? "No data")
        }.resume()
    }
    
}
