//
//  MainViewModel.swift
//  WeApp
//
//  Created by Даниил Липленко on 02.02.2025.
//

import Foundation

class MainViewModel: NSObject, ObservableObject {
    
    @Published var currentWeather: WeatherModel?
    
    func loadWeather() {
        WeatherManager.shared.fetchCurrentWeather { [weak self] weather in
            DispatchQueue.main.async {
                self?.currentWeather = weather
            }
        }
        
        
    }
    
}
