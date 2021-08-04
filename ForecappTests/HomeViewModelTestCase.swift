//
//  HomeViewModelTestCase.swift
//  ForecappTests
//
//  Created by thunderduck on 04/08/2021.
//

import XCTest
@testable import Forecapp

class MockViewModelDelegate: HomeViewModelDelegate {
    var delegateString = ""
    func displayData(_ city: String, _ temperature: String, _ pressure: String, weatherImage: String) {
        delegateString = city + " - " + temperature + " - " + pressure + " - " + weatherImage
    }
}

class HomeViewModelTestCase: XCTestCase {
    // DELEGATE
    let viewModelDelegate = MockViewModelDelegate()
    let homeViewModel = HomeViewModel()
    let api = MockForecaClient()
    
    override func setUpWithError() throws {
        homeViewModel.delegate = viewModelDelegate
        homeViewModel.api = api
    }

    func testDirectWeatherStore() throws {
        let weatherStore = homeViewModel.api?.getWeather()
        XCTAssertNotNil(weatherStore)
    }
   
    func testMockWeatherStore() throws {
        homeViewModel.update()
        XCTAssertEqual(homeViewModel.city, "Paris")
        XCTAssertEqual(homeViewModel.temp, "15")
        XCTAssertEqual(homeViewModel.pres, "1011")
    }
    
    func testDelegate() throws {
        homeViewModel.update()
        XCTAssertEqual(viewModelDelegate.delegateString, "Paris - 15°c - 1011 hPa - icloud")
        
    }

}
