//
//  AppCoordinator.swift
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
        
        let homeViewModel = HomeViewModel()
        let homeViewController = HomeViewController()
        
        homeViewController.viewModel = homeViewModel
        homeViewModel.delegate = homeViewController
        
        navigationController.pushViewController(homeViewController, animated: true)
    }
}
