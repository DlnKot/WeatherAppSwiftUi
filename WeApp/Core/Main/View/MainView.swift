//
//  MainView.swift
//  WeApp
//
//  Created by Даниил Липленко on 02.02.2025.
//

import SwiftUI
import CoreLocation

struct MainView: View {
    
    var latitude: String
    var longitude: String
    
    @StateObject private var viewModel = MainViewModel()
    @State private var selectedCity: String = "Москва" 
    
    var body: some View {
                VStack {
                    Tabbar(selectedCity: $selectedCity)
                    
                    if let weather = viewModel.coordWeather {
                        MainBlock(
                            selectedCity: weather.address,
                            currentWeather: weather.days[0].temp
                        )
                    } else {
                        Text("Loading...")
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                    
                    ProgresBlock()
                    Spacer()
                }
                .background(Color("BackgroundColor"))
                .onAppear {
                    viewModel.loadCoordWeather(latitude: latitude, longitude: longitude)
//                    selectedCity = viewModel.coordWeather?.name ?? "Moscow"
                }
//                .onChange(of: selectedCity) { newCity in
//                    viewModel.loadWeather(sity: newCity)
//                }
    }
}


