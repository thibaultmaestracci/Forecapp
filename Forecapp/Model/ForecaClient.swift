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
        request.setValue("Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9wZmEuZm9yZWNhLmNvbVwvYXV0aG9yaXplXC90b2tlbiIsImlhdCI6MTYyNzY4MjQ5OCwiZXhwIjoxNjI3Njg5Njk4LCJuYmYiOjE2Mjc2ODI0OTgsImp0aSI6IjZlZTA2NTA0ZDQ4MGI5OTIiLCJzdWIiOiJsaW5lY2hlY2siLCJmbXQiOiJYRGNPaGpDNDArQUxqbFlUdGpiT2lBPT0ifQ.ThXgiJYcuf7J3p-CrZY2qwMjlKw9_9aI7lzKMnHwH7Y", forHTTPHeaderField: "Authorization")
        
        let session = URLSession(configuration: .default)
        task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                completionHandler(nil)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completionHandler(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let results = try decoder.decode(WeatherResults.self, from: data)
                completionHandler(results)
            } catch {
                print ("ForecaClient - JSON decoder error")
            }
        }
        task?.resume()
    }
}
