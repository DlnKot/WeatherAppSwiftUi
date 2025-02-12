//
//  MainBlock.swift
//  WeApp
//
//  Created by Даниил Липленко on 02.02.2025.
//

import SwiftUI

struct MainBlock: View {
    
    @State var weather: WeatherModel
    
    var body: some View {
        VStack {
            Text(weather.address)
                .padding(16)
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(Color(.black))
            
            Text("\(String(format: "%.1f", weather.days.first?.temp ?? 0.0))°C")
                .padding(16)
                .font(.largeTitle)
                .fontWeight(.thin)
                .foregroundColor(Color(.black))
                
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    if let hours = weather.days.first?.hours {
                        let currentHour = getCurrentHour() // Получаем текущий час
                        let filteredHours = hours.filter { hour in
                            Int(hour.datetime.prefix(2)) ?? -1 >= currentHour
                        } // Оставляем только часы от текущего и далее
                        
                        ForEach(Array(filteredHours.enumerated()), id: \.element.datetime) { index, hour in
                            VStack {
                                Text(index == 0 ? "Now" : hour.datetime.prefix(2)) // Первый элемент "Now", остальные часы
                                    .padding(.top, 10)
                                Image(systemName: hour.icon.systemIcon().rawValue)
                                    .font(.title2)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                Text("\(String(format: "%.1f", hour.temp ?? 0.0))°C")
                                    .font(.title3)
                                    .padding(.horizontal, 10)
                                    .padding(.top, 2)
                                    .padding(.bottom, 10)
                            }
                            .padding(.horizontal, 12)
                            .background(Color("WeatherBlockColor"))
                            .foregroundColor(Color(.white))
                            .cornerRadius(10)
                        }
                    }
                }
            }
            .padding()
            .shadow(color: Color(.gray), radius: 4, x: 0, y: 0)
        }
    }
    
    // Функция для получения текущего часа
    func getCurrentHour() -> Int {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH" // Часы в 24-часовом формате
        return Int(formatter.string(from: Date())) ?? 0
    }
}
