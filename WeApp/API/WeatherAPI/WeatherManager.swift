import Foundation

final class WeatherManager {
    
    static let shared = WeatherManager()
    
    private init() {} // Закрываем инициализацию, чтобы не создавать экземпляры извне
    
    func fetchSityWeather(sity: String, completion: @escaping (WeatherModel?) -> Void) {
        var url = URLComponents()
        url.scheme = "https"
        url.host = "weather.visualcrossing.com"
        url.path = "VisualCrossingWebServices/rest/services/timeline/\(sity)"
        url.queryItems = [
            URLQueryItem(name: "elements", value: "datetime%2Cname%2Clatitude%2Clongitude%2Ctempmax%2Ctempmin%2Cfeelslike%2Cicon&include=days%2Chours%2Ccurrent%2Cfcst"),
            URLQueryItem(name: "appid", value: "PXD93BVZFAUL56EUJCHRL9CUC"),
            URLQueryItem(name: "contentType", value: "json"),
            URLQueryItem(name: "unitGroup", value: "metric") // Чтобы температура была в °C
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
            
            
            let url = URL(string: "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/\(latitude),\(longitude)?unitGroup=metric&elements=datetime%2Cname%2Clatitude%2Clongitude%2Ctempmax%2Ctempmin%2Ctemp%2Cfeelslike%2Cicon&include=days%2Chours%2Ccurrent%2Cfcst&key=PXD93BVZFAUL56EUJCHRL9CUC&contentType=json")
    
            guard let url else {
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
                
                if let responseString = String(data: data, encoding: .utf8) {
                        print("Raw Response:", responseString) // Выведет, что именно пришло от сервера
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

