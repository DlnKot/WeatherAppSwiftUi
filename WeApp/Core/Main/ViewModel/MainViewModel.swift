//
//  MainViewModel.swift
//  WeApp
//
//  Created by Даниил Липленко on 02.02.2025.
//

import Foundation

class MainViewModel: NSObject, ObservableObject {
    
    private let weatherManager = WeatherManager()
    
    override init() {
        super.init()
        weatherManager.fetchWeather()
    }
    
    
}
