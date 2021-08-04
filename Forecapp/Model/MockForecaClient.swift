//
//  MockForecaClient.swift
//  Forecapp
//
//  Created by thunderduck on 04/08/2021.
//

import Foundation



class MockForecaClient: APIClient {
    
    internal var weatherStore : [WeatherObservation] = [
        WeatherObservation(station: "Paris", temperature: 15, pressure: 1011.1, symbol: "rain"),
        WeatherObservation(station: "Madrid", temperature: 32, pressure: 1007.7, symbol: "rain"),
    ]
    
    func getWeather() -> [WeatherObservation] {
        return weatherStore
    }
    
    func fetchWithAlmofire(completionHandler: @escaping () -> Void) {
       self.fetchWeather(completionHandler: completionHandler)
       
    }
    
    private func fetchWeather(completionHandler: @escaping () -> Void) {
        completionHandler()
    }
}
