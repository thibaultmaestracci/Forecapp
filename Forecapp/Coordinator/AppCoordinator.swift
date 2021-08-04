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
    let detailViewModel = HomeViewModel()
    let listViewModel = ListViewModel()
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        
        // HOME
        let homeViewModel = HomeViewModel()
        let homeViewController = HomeViewController()
        homeViewController.viewModel = homeViewModel
                
        // SPLIT VIEW
        let listViewController = ListViewController()
        
        listViewController.viewModel = listViewModel
        listViewModel.appCoordinator = self
        
        //let detailViewModel = HomeViewModel()
        let detailViewController = HomeViewController()
        
        detailViewController.viewModel = detailViewModel
        
        let listNavigationController = UINavigationController(rootViewController: listViewController)
        let splitListViewController = UISplitViewController()
        
        splitListViewController.viewControllers = [listNavigationController,detailViewController]
        splitListViewController.preferredDisplayMode = .allVisible
        
        
        // API INJECTION
        let api = ForecaClient()
        
        homeViewModel.api = api
        listViewModel.api = api
        detailViewModel.api = api
        
        
        // MARK: Tab Bar Controller
        homeViewController.tabBarItem.title = "HOME"
        homeViewController.tabBarItem.image = UIImage(systemName: "cloud.sun")
        
        splitListViewController.tabBarItem.title = "LIST"
        splitListViewController.tabBarItem.image = UIImage(systemName: "circle.dashed")
        
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [
            homeViewController,
            splitListViewController
        ]
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
    
    func showDetailView(_ observation: WeatherObservation) {
        
        detailViewModel.updateFrom(observation)
        
        
    }
}
