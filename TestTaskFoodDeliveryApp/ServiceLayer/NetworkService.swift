//
//  NetworkService.swift
//  TestTaskFoodDeliveryApp
//
//  Created by Линар Нигматзянов on 13/10/2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func makeAPIRequest<T: Decodable>(with request: URLRequest,
                        _ successDataType: T.Type,
                        _ completionHandler: @escaping (Result<T, Error>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    
    public func makeAPIRequest<T: Decodable>(with request: URLRequest,
                                             _ successDataType: T.Type,
                                             _ completionHandler: @escaping (Result<T, Error>) -> Void) {

       
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
