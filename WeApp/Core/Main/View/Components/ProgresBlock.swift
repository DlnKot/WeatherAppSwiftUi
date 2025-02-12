import SwiftUI

struct ProgresBlock: View {
    
    @State var weather: WeatherModel
    
    
    let inputFormatter = DateFormatter()
    let outputFormatter = DateFormatter()
    
    init(weather: WeatherModel) {
        self._weather = State(initialValue: weather)
        
        // Настроим форматтеры
        inputFormatter.dateFormat = "yyyy-MM-dd"
        inputFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        outputFormatter.dateFormat = "EEEE"
        outputFormatter.locale = Locale(identifier: "ru_RU")
    }
    
    var body: some View {
        VStack {
            HStack{
                Text("Day")
                    .padding(.horizontal, 14)
                //                    .padding(.trailing, 30)
                Text("Max °C")
                //                    .padding(.leading, 38)
                    .padding(.horizontal, 16)
                Text("Min °C")
                    .padding(.horizontal, 5)
                Text("Feelslike °C")
                    .padding(.horizontal, 14)
            }
            .foregroundStyle(Color(.black))
            
            ScrollView(.vertical, showsIndicators: false){
                ForEach(Array(weather.days.enumerated()), id: \.element.datetime) { index, day in
                    
                    if let date = inputFormatter.date(from: day.datetime) {
                        let formattedDate = outputFormatter.string(from: date)
                        
                        VStack {
                            HStack {
                                Text(formattedDate.localizedCapitalized)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Image(systemName: day.icon.systemIcon().rawValue)
                                    .padding(.horizontal, 4)
                                
                                Text("\(String(format: "%.1f", day.tempmax))")
                                    .padding(.horizontal, 6)
                                Text("\(String(format: "%.1f", day.tempmin))")
                                    .padding(.horizontal, 6)
                                Text("\(String(format: "%.0f", day.feelslike))")
                                    .padding(.horizontal, 6)
                            }
                            .padding(6)
                        }
                        .foregroundStyle(Color(.white))
                        .padding(12)
                        .frame(maxWidth: .infinity)
                        .background(Color("WeatherBlockColor"))
                        .cornerRadius(10)
                        .padding(.horizontal, 10)
                    }
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 8)
            .shadow(color: Color(.gray), radius: 2, x: 0, y: 0)
        }
    }
}

#Preview {
    ProgresBlock(weather: WeatherModel(queryCost: 1, latitude: 0.0, longitude: 0.0, resolvedAddress: "Somewhere", address: "Somewhere", timezone: "GMT", tzoffset: 0, days: [], currentConditions: CurrentConditions(datetime: "2025-02-15", temp: 0.0, feelslike: 0.0, icon: .clearDay)))
}
