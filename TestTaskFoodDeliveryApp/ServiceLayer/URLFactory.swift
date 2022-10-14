//
//  URLFactory.swift
//  TestTaskFoodDeliveryApp
//
//  Created by Линар Нигматзянов on 14/10/2022.
//

import Foundation

enum ApiUrl: String {
    case basicURL = "https://pizzaallapala.p.rapidapi.com/productos"
}


enum URLFactory {
    
    static func getMenuPizzaRequest() -> URLRequest {
        let headers = [
            "X-RapidAPI-Key": "172e1cee76msh5afadce05c856a6p18df6fjsn9a0fabc1e5cb",
            "X-RapidAPI-Host": "pizzaallapala.p.rapidapi.com"
        ]
       let  url = URL(string: ApiUrl.basicURL.rawValue)
        var request = URLRequest(url: url!)
        request.httpMethod = HTTPMethod.get.rawValue
        request.allHTTPHeaderFields = headers
        
        return request
    }
    
   
}

enum HTTPMethod: String {
    case get = "GET"
}
