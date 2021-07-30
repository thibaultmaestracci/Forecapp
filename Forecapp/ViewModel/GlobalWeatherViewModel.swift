//
//  GlobalWeatherViewModel.swift
//  Forecapp
//
//  Created by thunderduck on 30/07/2021.
//
import Foundation

class GlobalWeatherViewModel {
    
    var delegate: ViewControllerDelegate?
    
    var city = "-"
    var temp = "-"
    
    func update() {
        let api = ForecaClient()
        api.fetchObservationMontpellier { weatherResults in
            guard let result = weatherResults?.observations.first else {return}
            
            DispatchQueue.main.async {
                self.city = result.station
                self.temp = String(result.temperature)
                self.delegate?.displayData(self.city, self.temp)
            }
        }
        }
}
