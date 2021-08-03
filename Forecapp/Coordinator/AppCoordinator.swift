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
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        
        guard let window = window else { return }
        
        let homeViewModel = HomeViewModel()
        let homeViewController = HomeViewController()
        
        homeViewController.viewModel = homeViewModel
        homeViewModel.delegate = homeViewController
        
        let listViewModel = ListViewModel()
        let listViewController = ListViewController()
        
        listViewController.viewModel = listViewModel
        listViewModel.delegate = listViewController
        
        // API INJECTION
        let api = ForecaClient()
        api.delegates.append(homeViewModel)
        api.delegates.append(listViewModel)
        homeViewModel.api = api
        listViewModel.api = api
        
        
        // MARK: Tab Bar Controller
        homeViewController.tabBarItem.title = "HOME"
        homeViewController.tabBarItem.image = UIImage(systemName: "cloud.sun")
        
        listViewController.tabBarItem.title = "LIST"
        listViewController.tabBarItem.image = UIImage(systemName: "circle.dashed")
        
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [
            homeViewController,
            listViewController
        ]
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
    
    func goToWeatherView() {
        
        
        
        
    }
}
