//
//  ListViewModel.swift
//  Forecapp
//
//  Created by thunderduck on 03/08/2021.
//

import Foundation

// MARK: PROTOCOL
protocol ListViewModelDelegate: AnyObject {
    func reloadData()
}

class ListViewModel {
    
    weak var delegate: ListViewModelDelegate?
    var api: ForecaClient!
    var appCoordinator : AppCoordinator?
    
    func update() {
        api.fetchWithAlmofire {
            self.delegate?.reloadData()
        }
    }
    
    
    
    func getTableViewNumberRows() -> Int {
        return api.getWeather().count
    }
    
    func getCellText(cell : Int) -> String {
        return api.getWeather()[cell].station
    }
    
    func getCellDetails(cell : Int) -> String {
        let observation  = api.getWeather()[cell]
        return "\(observation.temperature)°C - \(Int(observation.pressure)) hPa"
    }
    
    func showObservationDetail(cell : Int) {
        let observation  = api.getWeather()[cell]
        appCoordinator?.showDetailView(observation)
    }
}

