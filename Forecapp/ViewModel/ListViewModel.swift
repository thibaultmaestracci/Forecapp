//
//  ListViewModel.swift
//  Forecapp
//
//  Created by thunderduck on 03/08/2021.
//

import Foundation

// MARK: PROTOCOL
protocol ListViewModelDelegate: AnyObject {
    func displayData(observations : [WeatherObservation])
}

class ListViewModel {
    
    weak var delegate: ListViewModelDelegate?
    var api: ForecaClient!
    
    func update() {
        api.fetchWithAlmofire()
    }
}

extension ListViewModel: ForecaClientDelegate {
   func clientUpdated() {
        delegate?.displayData(observations: api.getWeather())
    
    }
    
    
}
