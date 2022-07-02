//
//  ToolBooxEndpoints.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 01/07/2022.
//

import Foundation
import Alamofire

fileprivate struct Constants {
    static let authPath = "/v1/mobile/auth"
    static let carouselsPath = "/v1/mobile/data"
}

enum ToolBooxEndpoints {
    case postAuth
    case getCarousels(token: TokenSession)
}


extension ToolBooxEndpoints: EndpointProtocol {
    
    var environment: NetworkEnvironment {
        .develop
    }
    
    var baseURL: URL {
        guard let url = URL(string: environment.getURL()) else {
            fatalError("Error when it wes setting a environment")
        }
        return url
    }
    
    var path: String {
        switch self {
            case .postAuth:
                return Constants.authPath
            case .getCarousels:
                return Constants.carouselsPath
        }
    }
    
    var httpMerthod: HTTPMethod {
        switch self {
            case .postAuth:
                return .post
            case .getCarousels:
                return .get
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
            case .getCarousels(let tokenSaved):
                print(tokenSaved.0)
                print(tokenSaved.1)

                let dict = ["authorization": "\(tokenSaved.0) \(tokenSaved.1)"]
                let headers = HTTPHeaders(dict)
                return headers
                
            default:
                return nil
        }
    }
    
    var params: Parameters? {
        switch self {
            case .postAuth:
                let authParams = ["sub": "ToolboxMobileTest"]
                return authParams
                
            default:
                return nil
        }
    }
    
    var apiKey: String? {
        return nil
    }
    
    
}
