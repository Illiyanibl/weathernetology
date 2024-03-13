//
//  MainPresenter.swift
//  weatherNetology
//
//  Created by Illya Blinov on 10.03.24.
//
import MapKit
import Foundation
protocol IMainPresenter: AnyObject {
    func start()
}
final class MainPresenter: IMainPresenter {
    weak var mainView: IMainViewController?
    var weatherService: IWeatherService?
    lazy var locationManager = CLLocationManager()
    private var userCoordinate: CLLocationCoordinate2D?
    var locationPermission: Bool? = nil

    init(mainView: IMainViewController? = nil, locationPermission: Bool? = nil, weatherService: IWeatherService? = nil) {
        self.mainView = mainView
        self.locationPermission = locationPermission
        self.weatherService = weatherService
    }
    func start(){
        if locationPermission == nil {
            requestLocation()
        }
        checkPermission()
        waitingResult()
    }

    private func requestLocation(){
        locationManager.requestWhenInUseAuthorization()
    }

    func waitingResult(){
        weatherService?.geoAction = { [weak self] city in
            guard let self else { return }
            self.mainView?.setTitle(title: city)
        }
        weatherService?.weatherAction = { [weak self] weather in
            print(weather.keys)
            let mass = weather["current"] as? [String: Any]
            guard let mass else { return }
           // print(mass)
            if let temp = (mass["temp"]) {
                self?.mainView?.setWeather(weather: ["\(temp)"])
            }
        }

    }

    private func checkPermission(){
        userCoordinate = locationManager.location?.coordinate
        if userCoordinate == nil {}
        else {
            guard let userCoordinate else { return }
            weatherService?.geoGet(lat: Float(userCoordinate.latitude), lon: Float(userCoordinate.longitude))
            weatherService?.weatherGet(lat: Float(userCoordinate.latitude), lon: Float(userCoordinate.longitude), units: "metric")
        }
    }
}
