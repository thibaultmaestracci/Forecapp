//
//  ViewController.swift
//  Forecapp
//
//  Created by thunderduck on 30/07/2021.
//

import UIKit

// MARK: PROTOCOL
protocol ViewControllerDelegate {
    func displayData(_ city: String, _ temperature : String)
}

// MARK: CLASS
class WeatherViewController: UIViewController {

    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var temperature: UILabel!
    
    var viewModel = GlobalWeatherViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
    }

    @IBAction func updateAction(_ sender: Any) {
        viewModel.update()
    }
    
}

// MARK: DELEGATE EXTENSION
extension WeatherViewController: ViewControllerDelegate {
    func displayData(_ city: String, _ temperature : String) {
        self.city.text = city
        self.temperature.text = temperature
    }
}


