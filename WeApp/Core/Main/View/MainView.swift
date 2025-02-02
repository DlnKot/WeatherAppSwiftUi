//
//  MainView.swift
//  WeApp
//
//  Created by Даниил Липленко on 02.02.2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            Tabbar()
            MainBlock()
            Spacer()
        }
        .background(Color("BackgroundColor"))
        
    }
    
}

#Preview {
    MainView()
}
