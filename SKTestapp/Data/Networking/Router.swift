//
//  Router.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 01/07/2022.
//

import Foundation
import Alamofire

class Router<EndPoint: EndpointProtocol>: AppNetworkRouter {
    
    func request(_ endpoint: EndPoint,
                 onResponse: @escaping RouterResponse) {
        
        let url = endpoint.baseURL.appendingPathComponent(endpoint.path)
        print("APP123 URL Request -> \(url)")
        var params: [String: Any] = [:]
        
        if let endpointParams = endpoint.params {
            params.combine(endpointParams)
        }
        
        AF.request(url, method: endpoint.httpMerthod, parameters: params, headers: endpoint.headers).responseData { response in
            print("APP123 URL Request -> \(String(describing: response.request?.urlRequest))")
            print("APP123 URL Request code -> \(String(describing: response.response?.statusCode))")

            switch response.result {
                case .success(let dataResponse):
                    onResponse(.success(dataResponse))
                case .failure(let error):
                    onResponse(.failure(error))
            }
        }.validate(statusCode: 200..<399)
    }
}
