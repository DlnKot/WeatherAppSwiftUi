//
//  WelcomeView.swift
//  WeApp
//
//  Created by Даниил Липленко on 10.02.2025.
//

import SwiftUI

struct WelcomeView: View {
    
    @StateObject private var locationManager = LocationManager()
        
        var body: some View {
            Group {
                if let location = locationManager.location {
                    MainView(latitude: location.latitude, longitude: location.longitude)
                } else {
                    ProgressView("Определяем местоположение...")
                        .onAppear {
                            locationManager.requestLocation()
                        }
                }
            }
        }
}

#Preview {
    WelcomeView()
}
