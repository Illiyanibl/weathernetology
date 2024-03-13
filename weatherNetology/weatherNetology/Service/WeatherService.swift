//
//  weatherService.swift
//  weatherNetology
//
//  Created by Illya Blinov on 3.03.24.
//
import Foundation
protocol IWeatherService: AnyObject {
    var geoAction: ((String) -> Void)? { get set }
    var weatherAction: (([String: Any]) -> Void)? { get set }
    func geoGet(lat: Float, lon: Float)
    func weatherGet(lat: Float, lon: Float, units: String)

}
final class WeatherService: IWeatherService {
    var geoAction: ((String) -> Void)?
    var weatherAction: (([String: Any]) -> Void)?
    let units = "metric"
    init(){}

    func weatherPrint(){
        geoGet(lat: 42.695326, lon: 27.710255)
        weatherGet(lat: 42.695326, lon: 27.710255, units: units)
    }

    private func urlWeatherGet(lat: Float, lon: Float, units: String)-> String {
        return "https://api.openweathermap.org/data/3.0/onecall?lat=\(lat)&lon=\(lon)&exclude=minutely&units=\(units)&appid=88463ea693d317dbf1ff79a7b98a9613"
    }

    private func urlGeoGet(lat: Float, lon: Float) -> String {
        return "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=88463ea693d317dbf1ff79a7b98a9613"
    }

    func geoGet(lat: Float, lon: Float){
        let url = urlGeoGet(lat: lat, lon: lon)
        NetworkService.requestURL(for: url){ [weak self] result in
            switch result {
            case let .success(resultData):
                guard let self else { return }
                let data = try? JSONSerialization.jsonObject(with: resultData, options: .allowFragments) as? [String: Any]
                let city: String = data?["name"] as? String ?? "?"
                self.geoAction?(city)
            case .failure(.custom):
                print("Network error")
            case .failure(.server):
                print("Server error")
            case .failure(.unknown):
                print("Error")
            }
        }
    }

    func weatherGet(lat: Float, lon: Float, units: String){
       let url = urlWeatherGet(lat: lat, lon: lon, units: units)
        print(url)
        NetworkService.requestURL(for: url){ [weak self] result in
            switch result {
            case let .success(resultData):
                guard let self else { return }
                let data = try? JSONSerialization.jsonObject(with: resultData, options: .allowFragments) as? [String: Any]
                self.weatherAction?(data ?? [:])
           //     print(data?["daily"])
            case .failure(.custom):
                print("Network error")
            case .failure(.server):
                print("Server error")
            case .failure(.unknown):
                print("Error")
            }
        }

    }
}
