//
//  Tabbar.swift
//  WeApp
//
//  Created by Даниил Липленко on 02.02.2025.
//

import SwiftUI

struct Tabbar: View {
    
    @State private var isShowingSearch = false
    @Binding var selectedCity: String
    
    var body: some View {
        HStack{
            Button(action: {
                
            }) {
                Image(systemName: "line.2.horizontal.decrease.circle")
                    .foregroundStyle(Color("MainTintColor"))
            }
            .padding(.horizontal, 16)
            .font(.title2)
        
            Spacer()
            
            Button(action: {
                isShowingSearch.toggle()
            }) {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(Color("MainTintColor"))
            }
            .padding(.horizontal, 16)
            .font(.title2)
            
        }
        .padding(.bottom, 32)
        .sheet(isPresented: $isShowingSearch) {
            SearchCityView(selectedCity: $selectedCity)
            
        }
    }
}


