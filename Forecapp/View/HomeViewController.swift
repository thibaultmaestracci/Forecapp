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
    private var updateButton: UIButton!
    
    var viewModel: HomeViewModel!
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .darkGray
        
        cityLabel = UILabel()
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.textAlignment = .center
        cityLabel.font = UIFont.systemFont(ofSize: 42)
        cityLabel.textColor = .white
        view.addSubview(cityLabel)
        
        let image = UIImage(systemName: "questionmark")
        weatherImage = UIImageView(image: image)
        weatherImage.tintColor = .white
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(weatherImage)
        
        tempLabel = UILabel()
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.textAlignment = .center
        tempLabel.font = UIFont.systemFont(ofSize: 42)
        tempLabel.textColor = .white
        view.addSubview(tempLabel)
        
        presLabel = UILabel()
        presLabel.translatesAutoresizingMaskIntoConstraints = false
        presLabel.textAlignment = .center
        presLabel.font = UIFont.systemFont(ofSize: 21, weight: .semibold)
        presLabel.textColor = .lightGray
        view.addSubview(presLabel)
        
        updateButton = UIButton(type: .system)
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        updateButton.setTitle("UPDATE", for: .normal)
        updateButton.backgroundColor = .white
        updateButton.layer.cornerRadius = 5
        view.addSubview(updateButton)
        
        updateButton.addTarget(self, action: #selector(updateAction), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 42),
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
            
            updateButton.topAnchor.constraint(equalTo: presLabel.bottomAnchor, constant: 42),
            updateButton.heightAnchor.constraint(equalToConstant: 40),
            updateButton.widthAnchor.constraint(equalToConstant: 200),
            updateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.update()
    }

    @objc func updateAction(_ sender: UIButton) {
        self.cityLabel.text = "-"
        self.tempLabel.text = "-"
        self.presLabel.text = "-"
        self.weatherImage.image = UIImage(systemName: "questionmark")
        self.updateButton.setTitle("UPDATING ...", for: .normal)
        viewModel.update()
    }
    
}

// MARK: DELEGATE EXTENSION
extension HomeViewController: HomeViewModelDelegate {
    func displayData(_ city: String, _ temperature: String, _ pressure: String, weatherImage: String) {
        self.cityLabel.text = city
        self.tempLabel.text = temperature
        self.presLabel.text = pressure
        self.weatherImage.image = UIImage(systemName: weatherImage)
        self.updateButton.setTitle("UPDATE", for: .normal)
    }
}


