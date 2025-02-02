//
//  MainView.swift
//  WeApp
//
//  Created by Даниил Липленко on 02.02.2025.
//

import SwiftUI

struct MainView: View {
    
    private var mainViewModel = MainViewModel()
    
    var body: some View {
        VStack {
            Tabbar()
            MainBlock()
            ProgresBlock()
            Spacer()
        }
        .background(Color("BackgroundColor"))
        
    }
    
}

#Preview {
    MainView()
}
