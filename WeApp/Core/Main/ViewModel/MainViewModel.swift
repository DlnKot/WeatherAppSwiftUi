//
//  MainViewModel.swift
//  WeApp
//
//  Created by Даниил Липленко on 02.02.2025.
//

import Foundation

class MainViewModel: NSObject, ObservableObject {
    
    private var locationManager = LocationManager()
    @Published var currentWeather: WeatherModel?
    @Published var coordWeather: WeatherModel?
    
//    private let locationManager = LocationManager()
    
    func loadWeather(sity: String) {
        WeatherManager.shared.fetchSityWeather(sity: sity) { [weak self] weather in
            DispatchQueue.main.async {
                self?.currentWeather = weather
            }
        }
    }
    
    func loadCoordWeather(latitude: String, longitude: String) {
        WeatherManager.shared.fetchCoordWeather(latitude: latitude, longitude: longitude) { [weak self] weather in
                DispatchQueue.main.async {
                    self?.coordWeather = weather
            }
        }
    }
    
}
