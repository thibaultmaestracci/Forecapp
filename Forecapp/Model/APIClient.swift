//
//  APIClient.swift
//  Forecapp
//
//  Created by thunderduck on 04/08/2021.
//

import Foundation

protocol APIClient {
    
    func getWeather() -> [WeatherObservation]
    func fetchWithAlmofire(completionHandler: @escaping () -> Void)
}
