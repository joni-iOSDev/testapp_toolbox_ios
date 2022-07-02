//
//  EndpointProtocol.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 01/07/2022.
//

import Foundation
import Alamofire

protocol EndpointProtocol {
    var environment: NetworkEnvironment { get }
    var baseURL: URL { get }
    var path: String { get }
    var httpMerthod: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var params: Parameters? { get }
}

extension Parameters {
    mutating func combine(_ parameters: Parameters) {
        for (keyParam, valueParam) in parameters {
            updateValue(valueParam, forKey: keyParam)
        }
    }
}
