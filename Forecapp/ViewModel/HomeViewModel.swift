//
//  GlobalWeatherViewModel.swift
//  Forecapp
//
//  Created by thunderduck on 30/07/2021.
//
import Foundation

class HomeViewModel {
    
    weak var delegate: ViewControllerDelegate?
    
    var city = "-"
    var temp = "-"
    var pres = "-"
    
    func update() {
        let api = ForecaClient()
        api.fetchObservationMontpellier { [unowned self] weatherResults in
            guard let result = weatherResults?.observations.first else {return}
            
            DispatchQueue.main.async {
                self.city = result.station
                self.temp = String(result.temperature)
                self.pres = String(Int(result.pressure))
                self.delegate?.displayData(self.city, self.temp + "°c", self.pres + " hPa")
            }
        }
        }
}
