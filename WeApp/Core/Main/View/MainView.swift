//
//  MainView.swift
//  WeApp
//
//  Created by Даниил Липленко on 02.02.2025.
//

import SwiftUI
import CoreLocation

struct MainView: View {
    
    var latitude: CLLocationDegrees
    var longitude: CLLocationDegrees
    
    @StateObject private var viewModel = MainViewModel()
    @State private var selectedCity: String
    
    var body: some View {
        VStack {
            Tabbar(selectedCity: $selectedCity)
            
            if let weather = viewModel.coordWeather {
                MainBlock(weather: weather)
                ProgresBlock(weather: weather)
                
            } else {
                Text("Loading...")
                    .font(.headline)
                    .foregroundColor(.gray)
            }
            
            
            Spacer()
        }
        .background(Color("BackgroundColor"))
        .onAppear {
            viewModel.loadCoordWeather(latitude: latitude, longitude: longitude)
        }
        .onChange(of: selectedCity) { newCity in
            viewModel.loadWeather(city: selectedCity)
        }
    }
}


