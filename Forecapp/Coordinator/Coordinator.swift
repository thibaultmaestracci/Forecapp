//
//  Coordinator.swift
//  Forecapp
//
//  Created by thunderduck on 02/08/2021.
//

import UIKit

protocol Coordinator {
    var navigationController : UINavigationController { get set }
    func start()
}

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navCon : UINavigationController) {
        self.navigationController = navCon
    }
    
    func start() {
        print("App Coordinator Start")
        goToWeatherView()
        
    }
    
    func goToWeatherView() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: .main)
        let weatherVC = storyboard.instantiateViewController(identifier: "main.storyboard.weatherVC") as! WeatherViewController
        
        let weatherViewModel = GlobalWeatherViewModel.init()
        
        weatherVC.viewModel = weatherViewModel
        weatherViewModel.delegate = weatherVC
        
        navigationController.pushViewController(weatherVC, animated: true)
    }
}
