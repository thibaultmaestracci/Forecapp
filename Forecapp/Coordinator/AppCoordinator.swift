//
//  AppCoordinator.swift
//  Forecapp
//
//  Created by thunderduck on 02/08/2021.
//

import UIKit

protocol Coordinator {
    func start()
}

class AppCoordinator: Coordinator {
    let window: UIWindow?
    
    private let homeViewModel = HomeViewModel()
    private let homeViewController = HomeViewController()
    private var navController = UINavigationController()
    private let api = ForecaClient()
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        
        homeViewController.viewModel = homeViewModel
        homeViewModel.api = api
        
        navController = UINavigationController(rootViewController: homeViewController)
        
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
    
    
}
