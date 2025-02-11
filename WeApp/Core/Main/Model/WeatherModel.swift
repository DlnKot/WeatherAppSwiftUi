import Foundation

// MARK: - WeatherModel
struct WeatherModel: Codable {
    let queryCost: Int
    let latitude, longitude: Double
    let resolvedAddress, address, timezone: String
    let tzoffset: Int
    let days: [Day]
    let currentConditions: CurrentConditions
}

// MARK: - CurrentConditions
struct CurrentConditions: Codable {
    let datetime: String
    let temp, feelslike: Double?
    let icon: Icon
}

enum Icon: String, Codable {
    case clearDay = "clear-day"
    case clearNight = "clear-night"
    case cloudy = "cloudy"
    case empty = ""
    case fog = "fog"
    case partlyCloudyDay = "partly-cloudy-day"
    case partlyCloudyNight = "partly-cloudy-night"
    case snow = "snow"
}

// MARK: - Day
struct Day: Codable {
    let datetime: String
    let tempmax, tempmin, temp, feelslike: Double
    let icon: Icon
    let hours: [CurrentConditions]
}
