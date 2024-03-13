//
//  MainModel.swift
//  weatherNetology
//
//  Created by Illya Blinov on 4.03.24.
//
import Foundation
struct WatherModel: Decodable {
    var city: String?
    var current: Current
    var daily: [Daily]
    var hourly: [Hourly]


    enum WatherCodingKeys: String, CodingKey {
        case city, current, daily, hourly
    }
}

struct Current: Decodable {
    var dt: Int
    var sunrise: Int
    var sunset: Int
    var temp: Float
    var feelsLike: Float
    var pressure: Int
    var humidity: Int
    var dew_point: Float
    var uvi: Float
    var clouds: Int
    var visibility: Int?
    var windSpeed: Float
    var windDeg: Int?
    var windGust: Float

    enum CurrentCodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp, pressure, humidity, uvi, clouds, visibility
        case feelsLike = "feels_like"
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
    }
}

struct Hourly: Decodable {

}

struct Daily: Decodable {

}
