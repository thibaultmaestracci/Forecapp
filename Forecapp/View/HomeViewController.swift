//
//  ViewController.swift
//  Forecapp
//
//  Created by thunderduck on 30/07/2021.
//

import UIKit


class HomeViewController: UIViewController {

    private var cityLabel: UILabel!
    private var weatherImage: UIImageView!
    private var tempLabel: UILabel!
    private var presLabel: UILabel!

    
    var viewModel: HomeViewModel!
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        // MARK:- NavBar
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        title = "Forecapp"
        
        let refreshButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refresh))
        navigationItem.leftBarButtonItem = refreshButton

        
        // MARK:- View Setup
        
        cityLabel = UILabel()
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.textAlignment = .center
        cityLabel.font = UIFont.systemFont(ofSize: 42)
        cityLabel.textColor = .black
        view.addSubview(cityLabel)
        
        let image = UIImage()
        weatherImage = UIImageView(image: image)
        weatherImage.tintColor = .black
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(weatherImage)
        
        tempLabel = UILabel()
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.textAlignment = .center
        tempLabel.font = UIFont.systemFont(ofSize: 42)
        tempLabel.textColor = .black
        view.addSubview(tempLabel)
        
        presLabel = UILabel()
        presLabel.translatesAutoresizingMaskIntoConstraints = false
        presLabel.textAlignment = .center
        presLabel.font = UIFont.systemFont(ofSize: 21, weight: .semibold)
        presLabel.textColor = .darkGray
        view.addSubview(presLabel)
        
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 142),
            cityLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 10),
            cityLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -10),
            
            weatherImage.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 42),
            weatherImage.heightAnchor.constraint(equalToConstant: 120),
            weatherImage.widthAnchor.constraint(equalToConstant: 120),
            weatherImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tempLabel.topAnchor.constraint(equalTo: weatherImage.bottomAnchor, constant: 42),
            tempLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 10),
            tempLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -10),
            
            presLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 42),
            presLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 10),
            presLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -10),
  
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.update()
    }

    
    
    @objc private func refresh() {
        self.cityLabel.text = "-"
        self.tempLabel.text = "-"
        self.presLabel.text = "-"
        self.weatherImage.image = UIImage(systemName: "questionmark")
        viewModel.update()
        print("refresh tapped")
    }
    
}

// MARK: DELEGATE EXTENSION
extension HomeViewController: HomeViewModelDelegate {
    func displayData(_ city: String, _ temperature: String, _ pressure: String, weatherImage: String) {
        self.cityLabel.text = city
        self.tempLabel.text = temperature
        self.presLabel.text = pressure
        self.weatherImage.image = UIImage(named: weatherImage)
    }
}


