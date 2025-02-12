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
struct CurrentConditions: Codable, Hashable {
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
    case rain = "rain"

    
    func systemIcon() -> SystemIcon {
        switch self {
        case .clearDay: return .clearDay
        case .clearNight: return .clearNight
        case .cloudy: return .cloudy
        case .empty: return .empty
        case .fog: return .fog
        case .partlyCloudyDay: return .partlyCloudyDay
        case .partlyCloudyNight: return .partlyCloudyNight
        case .snow: return .snow
        case .rain: return .rain
        }
    }
}

enum SystemIcon: String, Codable {
    case clearDay = "sun.max"
    case clearNight = "moon"
    case cloudy = "cloud"
    case empty = ""
    case fog = "cloud.fog"
    case partlyCloudyDay = "cloud.sun"
    case partlyCloudyNight = "cloud.moon"
    case snow = "cloud.snow"
    case rain = "cloud.rain"
}
// MARK: - Day
struct Day: Codable {
    let datetime: String
    let tempmax, tempmin, temp, feelslike: Double
    let icon: Icon
    let hours: [CurrentConditions]
}
