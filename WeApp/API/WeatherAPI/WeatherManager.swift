import Foundation
import CoreLocation

final class WeatherManager {
    
    let geoCoder = CLGeocoder()
    static let shared = WeatherManager()
    
    private init() {} // Закрываем инициализацию, чтобы не создавать экземпляры извне
    
    func fetchCityWeather(city: String, completion: @escaping (WeatherModel?) -> Void) {
        
        let url = URL(string: "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/\(city)?unitGroup=metric&elements=datetime%2Cname%2Clatitude%2Clongitude%2Ctempmax%2Ctempmin%2Ctemp%2Cfeelslike%2Cicon&include=days%2Chours%2Ccurrent%2Cfcst&key=PXD93BVZFAUL56EUJCHRL9CUC&contentType=json")
        
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
            
            
            do {
                let weather = try JSONDecoder().decode(WeatherModel.self, from: data)
                completion(weather)
            } catch {
                print("Decoding error:", error)
                completion(nil)
            }
        }.resume()
    }
    
    
    
    
    
    
    
    
    func fetchCoordWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees, completion: @escaping (WeatherModel?) -> Void) {
        
        
        let location = CLLocation(latitude: latitude, longitude: longitude)
        
        geoCoder.reverseGeocodeLocation(location) { placemarks, error in
            if let placemark = placemarks?.first {
                
                guard let  cityName = placemark.locality else {
                    completion(nil)
                    return
                }
                let url = URL(string: "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/\(cityName)?unitGroup=metric&elements=datetime%2Cname%2Clatitude%2Clongitude%2Ctempmax%2Ctempmin%2Ctemp%2Cfeelslike%2Cicon&include=days%2Chours%2Ccurrent%2Cfcst&key=PXD93BVZFAUL56EUJCHRL9CUC&contentType=json")
                
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
                    
                    
                    do {
                        let weather = try JSONDecoder().decode(WeatherModel.self, from: data)
                        completion(weather)
                    } catch {
                        print("Decoding error:", error)
                        completion(nil)
                    }
                }.resume()
            }
            else {
                completion(nil)
                return
            }
        }
    }
    
}

