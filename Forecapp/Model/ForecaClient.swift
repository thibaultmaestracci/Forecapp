//
//  ForecaClient.swift
//  Forecapp
//
//  Created by thunderduck on 30/07/2021.
//

import Foundation

class ForecaClient {
    
    private var task: URLSessionDataTask?
    
    func fetchObservationMontpellier(completionHandler: @escaping(WeatherResults?) -> Void) {
        let url = URL(string: "https://pfa.foreca.com/api/v1/observation/latest/102992166")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9wZmEuZm9yZWNhLmNvbVwvYXV0aG9yaXplXC90b2tlbiIsImlhdCI6MTYyNzYzNTE3NywiZXhwIjoxNjI3NjQyMzc3LCJuYmYiOjE2Mjc2MzUxNzcsImp0aSI6IjZmNGU3ODY5ZGYwMmUyMTMiLCJzdWIiOiJsaW5lY2hlY2siLCJmbXQiOiJYRGNPaGpDNDArQUxqbFlUdGpiT2lBPT0ifQ.jKv5iDzosCk-lnR7-0u2Avq3lligQEUSdCaKWFSAEAs", forHTTPHeaderField: "Authorization")
        
        let session = URLSession(configuration: .default)
        task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                print ("ForecaClient() - cannot parse data or error")
                completionHandler(nil)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print ("ForecaClient() - invalid status code")
                completionHandler(nil)
                return
            }
            print(response.statusCode)
            
            do {
                let decoder = JSONDecoder()
                let results = try decoder.decode(WeatherResults.self, from: data)
                
                guard let result = results.observations.first else {
                    print ("ForecaClient() - guard error")
                    return
                    
                }
                print (result.temperature)
                completionHandler(results)
            } catch {
                print ("ForecaClient() - JSON decoder error")
            }
            
            
        }
        task?.resume()
    }
}
