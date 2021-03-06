//
//  WeatherObservation.swift
//  Forecapp
//
//  Created by thunderduck on 30/07/2021.
//

import Foundation

struct WeatherObservation: Decodable {
    var station: String
    var temperature: Int
    var pressure: Double
    var symbol: String
}


struct WeatherResults: Decodable {
    var observations: [WeatherObservation]
}
