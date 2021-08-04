//
//  GlobalWeatherViewModel.swift
//  Forecapp
//
//  Created by thunderduck on 30/07/2021.
//
import Foundation


// MARK: PROTOCOL
protocol HomeViewModelDelegate: AnyObject {
    func displayData(_ city: String, _ temperature: String, _ pressure: String, weatherImage: String)
}

// MARK: ViewModel
class HomeViewModel {
    
    weak var delegate: HomeViewModelDelegate?
    var api: APIClient?
    
    var city = "-"
    var temp = "-"
    var pres = "-"
    
    func update() {
        guard let api = api else { return }
        api.fetchWithAlmofire {
            guard let result = api.getWeather().first else {return}
            self.updateFrom(result)
        }
    }
    
    func updateFrom(_ observation: WeatherObservation) {
        city = observation.station
        temp = String(observation.temperature)
        pres = String(Int(observation.pressure))
        var symbol = String()
        switch observation.symbol {
        case "d000": symbol = "sun.max"
        case "d220": symbol = "cloud.sun.rain"
        case "d430": symbol = "cloud.sleet"
        default: symbol = "icloud"
            print("symb= \(observation.symbol)")
        }
        delegate?.displayData(self.city, self.temp + "°c", self.pres + " hPa", weatherImage: symbol)
    }
}
