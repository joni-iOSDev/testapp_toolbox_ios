//
//  ToolBooxEndpoints.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 01/07/2022.
//

import Foundation
import Alamofire

fileprivate struct Constants {
    static let auth = "/v1/mobile/auth"
}

enum ToolBooxEndpoints {
    case auth
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
            case .auth:
                return Constants.auth
        }
    }
    
    var httpMerthod: HTTPMethod {
        switch self {
            case .auth:
                return .post
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
    var params: Parameters? {
        switch self {
            case .auth:
                let authParams = ["sub": "ToolboxMobileTest"]
                return authParams
        }
    }
    
    var apiKey: String? {
        return nil
    }
    
    
}
