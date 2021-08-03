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
    var api: ForecaClient!
    
    var city = "-"
    var temp = "-"
    var pres = "-"
    
    func update() {
        
        api.fetchWithAlmofire()
    }
}

extension HomeViewModel: ForecaClientDelegate {
    func clientUpdated() {
        guard let result = api.getWeather().first else {return}
        city = result.station
        temp = String(result.temperature)
        pres = String(Int(result.pressure))
        delegate?.displayData(self.city, self.temp + "°c", self.pres + " hPa", weatherImage: "sun.max")
    }
    
    
}
