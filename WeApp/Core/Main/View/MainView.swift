//
//  MainView.swift
//  WeApp
//
//  Created by Даниил Липленко on 02.02.2025.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        VStack {
            Tabbar()
            
            if let weather = viewModel.currentWeather {
                MainBlock(
                    currentSity: weather.name,
                    currentWeather: weather.main.temp
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
            viewModel.loadWeather()
        }
    }
}

#Preview {
    MainView()
}
