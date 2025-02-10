import Foundation

final class WeatherManager {
    
    static let shared = WeatherManager()
    
    private init() {} // Закрываем инициализацию, чтобы не создавать экземпляры извне
    
    func fetchSityWeather(sity: String, completion: @escaping (WeatherModel?) -> Void) {
        var url = URLComponents()
        url.scheme = "https"
        url.host = "api.openweathermap.org"
        url.path = "/data/2.5/weather"
        url.queryItems = [
            URLQueryItem(name: "q", value: sity),
            URLQueryItem(name: "appid", value: "b1a37ce1ca53f4f82319634615c40bb4"),
            URLQueryItem(name: "units", value: "metric") // Чтобы температура была в °C
        ]
        
        guard let url = url.url else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error:", error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let weather = try JSONDecoder().decode(WeatherModel.self, from: data)
                completion(weather)
            } catch {
                print("Decoding error:", error)
                completion(nil)
            }
        }.resume()
    }
    
    
    
    //TODO: Доделать чертов менеджер
    
        func fetchCoordWeather(latitude: String, longitude: String, completion: @escaping (WeatherModel?) -> Void) {
            
            var url = URLComponents()
            url.scheme = "https"
            url.host = "api.openweathermap.org"
            url.path = "/data/2.5/weather"
            
            url.queryItems = [
                URLQueryItem(name: "lat", value: latitude),
                URLQueryItem(name: "lon", value: longitude),
                URLQueryItem(name: "appid", value: "b1a37ce1ca53f4f82319634615c40bb4"),
                URLQueryItem(name: "units", value: "metric")
            ]
    
            guard let url = url.url else {
                completion(nil)
                return
            }
    
            URLSession.shared.dataTask(with: url) { data, _, error in
                if let error = error {
                    print("Error:", error.localizedDescription)
                    completion(nil)
                    return
                }
    
                guard let data = data else {
                    completion(nil)
                    return
                }
    
                do {
                    let weather = try JSONDecoder().decode(WeatherModel.self, from: data)
                    completion(weather)
                } catch {
                    print("Decoding error:", error)
                    completion(nil)
                }
            }.resume()
        }
    }

