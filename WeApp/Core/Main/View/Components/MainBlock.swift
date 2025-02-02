//
//  MainBlock.swift
//  WeApp
//
//  Created by Даниил Липленко on 02.02.2025.
//

import SwiftUI

struct MainBlock: View {
    var body: some View {
        VStack {
            Text("Москва")
                .padding(16)
                .font(.title)
                .fontWeight(.medium)
            
            Text("23°C")
                .padding(16)
                .font(.largeTitle)
                .fontWeight(.thin)
                
            ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0..<10, id: \.self) { index in
                                VStack{
                                    Text("2")
                                        .padding(.top, 10)
                                    Image(systemName: "sun.max")
                                        .font(.title2)
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 5)
                                    Text("21°C")
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
                    .padding()
                    .shadow(color: Color(.gray),radius: 4, x: 0, y: 0)
        }
    }
}

#Preview {
    MainBlock()
}
