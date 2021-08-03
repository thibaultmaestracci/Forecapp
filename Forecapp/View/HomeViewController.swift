//
//  ViewController.swift
//  Forecapp
//
//  Created by thunderduck on 30/07/2021.
//

import UIKit

// MARK: PROTOCOL
protocol ViewControllerDelegate: AnyObject {
    func displayData(_ city: String, _ temperature : String, _ pressure : String)
}

// MARK: CLASS
class HomeViewController: UIViewController {

    private var cityLabel: UILabel!
    private var tempLabel: UILabel!
    private var presLabel: UILabel!
    
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
        
        let updateButton = UIButton(type: .system)
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        updateButton.setTitle("UPDATE", for: .normal)
        view.addSubview(updateButton)
        
        updateButton.addTarget(self, action: #selector(updateAction), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 42),
            cityLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 10),
            cityLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 10),
            
            tempLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 42),
            tempLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 10),
            tempLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 10),
            
            presLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 42),
            presLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 10),
            presLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 10),
            
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.update()
    }

    @objc func updateAction(_ sender: UIButton) {
        viewModel.update()
    }
    
}

// MARK: DELEGATE EXTENSION
extension HomeViewController: ViewControllerDelegate {
    func displayData(_ city: String, _ temperature : String, _ pressure : String) {
        self.cityLabel.text = city
        self.tempLabel.text = temperature
        self.presLabel.text = pressure
    }
}


