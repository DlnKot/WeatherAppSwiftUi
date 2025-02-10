//
//  SearchSityView.swift
//  WeApp
//
//  Created by Даниил Липленко on 09.02.2025.
//

import SwiftUI

struct SearchCityView: View {
    
    @Binding var selectedCity: String
    @State var cityInput: String = ""
    @Environment(\.dismiss) var dismiss
    
    let suggestedCities = ["Москва", "Санкт-Петербург", "Ставрополь", "Саратов","Нью Йорк", "Лондон", "Париж", "Токио"]
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Just start typing...", text: $selectedCity)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .onSubmit {
                        dismiss()
                    }
                
                List(suggestedCities.filter { selectedCity.isEmpty || $0.lowercased().contains(selectedCity.lowercased()) }, id: \.self) { city in
                    Button(action: {
                        print("Выбран город: \(city)")
                        selectedCity = city
                        dismiss() 
                    }) {
                        Text(city)
                            .foregroundStyle(Color("MainTintColor"))
                    }
                    
                }
            }
            .navigationTitle("Where are you from?")
            
        }
        .background(Color("BackgroundColor"))
    }
        
}


