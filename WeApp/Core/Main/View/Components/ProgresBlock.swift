//
//  ProgresBlock.swift
//  WeApp
//
//  Created by Даниил Липленко on 02.02.2025.
//

import SwiftUI

struct ProgresBlock: View {
    var body: some View {
        VStack {
            HStack{
                Text("Day")
                    .padding(.horizontal, 14)
                    .padding(.trailing, 41)
                Text("Max")
                    .padding(.leading, 38)
                    .padding(.horizontal, 16)
                Text("Min")
                    .padding(.horizontal, 5)
                Text("Humid")
                    .padding(.horizontal, 14)
            }
            .foregroundStyle(Color(.black))
            
            ScrollView(.vertical, showsIndicators: false){
                ForEach(0..<6, id: \.self) { index in
                    VStack {
                        HStack{
                            Text("Mondey")
                                .padding(.horizontal, 14)
                            Image(systemName: "sun.max")
                                .padding(.horizontal, 12)
                            Text("23°C")
                                .padding(.horizontal, 8)
                            Text("12°C")
                                .padding(.horizontal, 8)
                            Text("46%")
                                .padding(.horizontal, 14)
                        }
                        .padding(5)
                    }
                    .foregroundStyle(Color(.white))
                    .padding(16)
                    .background(Color("WeatherBlockColor"))
                    .cornerRadius(10)
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 8)
            .shadow(color: Color(.gray),radius: 2, x: 0, y: 0)
        }
//        .background(Color(.gray))
//        .cornerRadius(10)
    }
}

#Preview {
    ProgresBlock()
}
