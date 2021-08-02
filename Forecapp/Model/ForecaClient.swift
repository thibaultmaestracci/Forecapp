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
        request.setValue("Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9wZmEuZm9yZWNhLmNvbVwvYXV0aG9yaXplXC90b2tlbiIsImlhdCI6MTYyNzg5NjkyMywiZXhwIjoxNjI4NTAxNzIzLCJuYmYiOjE2Mjc4OTY5MjMsImp0aSI6ImMwOGFkNzQ4NTM1Y2E5YjYiLCJzdWIiOiJsaW5lY2hlY2siLCJmbXQiOiJYRGNPaGpDNDArQUxqbFlUdGpiT2lBPT0ifQ.j_hqZQj8dHOBiEvUt_OBndAbMKvNNQfPsk2UOrfKa6g", forHTTPHeaderField: "Authorization")
        
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
