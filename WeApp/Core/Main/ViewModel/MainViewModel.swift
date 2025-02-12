//
//  MainViewModel.swift
//  WeApp
//
//  Created by Даниил Липленко on 02.02.2025.
//

import Foundation
import CoreLocation

class MainViewModel: NSObject, ObservableObject {
    
    private var locationManager = LocationManager()
    @Published var currentWeather: WeatherModel?
    @Published var coordWeather: WeatherModel?
    
    
    func loadWeather(city: String) {
        WeatherManager.shared.fetchCityWeather(city: city) { [weak self] weather in
            DispatchQueue.main.async {
                self?.coordWeather = weather
            }
        }
    }
    
    func loadCoordWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        WeatherManager.shared.fetchCoordWeather(latitude: latitude, longitude: longitude) { [weak self] weather in
            DispatchQueue.main.async {
                self?.coordWeather = weather
            }
        }
    }
    
}
    
    
    
    
    
