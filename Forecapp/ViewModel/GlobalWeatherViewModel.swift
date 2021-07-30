//
//  GlobalWeatherViewModel.swift
//  Forecapp
//
//  Created by thunderduck on 30/07/2021.
//

class GlobalWeatherViewModel {
    
    var delegate: ViewControllerDelegate?
    
    var city = "Montpellier"
    var temp = "27°c"
    
    func update() {
        // update from api
        
        delegate?.displayData(city, temp)
    }
}
