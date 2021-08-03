//
//  ListViewController.swift
//  Forecapp
//
//  Created by thunderduck on 03/08/2021.
//

import UIKit


// MARK: CLASS
class ListViewController: UITableViewController {
    
    var viewModel: ListViewModel!
    var observations : [WeatherObservation]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        viewModel.update()
    }
}


// MARK: EXTENSION TABLE VIEW
extension ListViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let observations = observations else { return 0 }
        return observations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if cell.detailTextLabel == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        }
        guard let observation = observations?[indexPath.row] else { return cell }
        cell.textLabel?.text = observation.station
        cell.detailTextLabel?.text = "\(observation.temperature)°C - \(Int(observation.pressure)) hPa"
        return cell
    }
}

// MARK: DELEGATE EXTENSION
extension ListViewController: ListViewModelDelegate {
    func displayData(observations : [WeatherObservation]) {
        self.observations = observations
        tableView.reloadData()
    }
}
