//
//  ForecaClient.swift
//  Forecapp
//
//  Created by thunderduck on 30/07/2021.
//

import Foundation
import Alamofire

protocol ForecaClientDelegate: AnyObject {
    func clientUpdated()
}

struct Token: Decodable {
    var access_token: String
    var expires_in: Int
    var token_type: String
}

struct User: Codable {
    var user: String
    var password: String
}

class ForecaClient {
    
    private var weatherStore = [WeatherObservation]()
    var delegates = [ForecaClientDelegate]()
    
    let apiusername = "linecheck"
    let apipassword = "Uj3W3Dr6Lmt6"
    var token : Token?
    
    func getWeather() -> [WeatherObservation] {
        return weatherStore
    }
     
    func fetchWithAlmofire() {
        if token != nil {
            fetchWeather()
        } else {
            self.getToken {
                self.fetchWeather()
            }
        }
    }
    
    private func getToken(completionHandler: @escaping () -> Void){
        let login = User(user: apiusername, password: apipassword)

        AF.request("https://pfa.foreca.com/authorize/token?expire_hours=2", method: .post, parameters: login, encoder: JSONParameterEncoder.default).response { response in
                switch (response.result) {
                    case .success( _):
                        do {
                            let result = try JSONDecoder().decode(Token.self, from: response.data!)
                            self.token = result
                            DispatchQueue.main.async {
                                completionHandler()
                            }
                        } catch let error as NSError {
                            print("Failed to load: \(error.localizedDescription)")
                        }

                     case .failure(let error):
                        print("Request error: \(error.localizedDescription)")
                 }
            
               }
        
        
    }
    
    
    
    private func fetchWeather() {
        guard let authorization = token?.access_token else {return}
        let headers: HTTPHeaders = [
            "Authorization": "Bearer " + authorization
        ]
        
        AF.request("https://pfa.foreca.com/api/v1/observation/latest/102992166", headers: headers)
            .validate()
            .responseJSON { response in
                switch (response.result) {
                    case .success( _):

                        do {
                            let results = try JSONDecoder().decode(WeatherResults.self, from: response.data!)
                            self.weatherStore = results.observations
                            DispatchQueue.main.async {
                                for (delegate) in self.delegates {
                                    delegate.clientUpdated()
                                }
                                
                            }

                        } catch let error as NSError {
                            print("Failed to load: \(error.localizedDescription)")
                        }

                     case .failure(let error):
                        print("Request error: \(error.localizedDescription)")
                 }
            }
    }
}
