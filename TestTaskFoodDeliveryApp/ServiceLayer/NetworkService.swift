//
//  NetworkService.swift
//  TestTaskFoodDeliveryApp
//
//  Created by Линар Нигматзянов on 13/10/2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func makeAPIRequest<T: Decodable>(with urlString: String,
                        _ successDataType: T.Type,
                        _ completionHandler: @escaping (Result<T, Error>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    
    public func makeAPIRequest<T: Decodable>(with urlString: String,
                                             _ successDataType: T.Type,
                                             _ completionHandler: @escaping (Result<T, Error>) -> Void) {
        let headers = [
            "X-RapidAPI-Key": "172e1cee76msh5afadce05c856a6p18df6fjsn9a0fabc1e5cb",
            "X-RapidAPI-Host": "pizzaallapala.p.rapidapi.com"
        ]
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
       
        // https://pizzaallapala.p.rapidapi.com/productos
        
        let task = URLSession.shared.dataTask(with: request) { result, _, error in
            if let error = error {
                completionHandler(.failure(error))
            }
            guard let data = result else { return }
            
            var decodedResult: T
            do {
                decodedResult = try JSONDecoder().decode(T.self, from: data)
                
                completionHandler(.success(decodedResult))
            } catch {
                completionHandler(.failure(error))
            }
        }
        task.resume()
    }
}
