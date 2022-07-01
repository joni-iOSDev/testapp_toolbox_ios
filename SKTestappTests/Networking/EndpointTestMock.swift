//
//  EndpointTestMock.swift
//  SKTestappTests
//
//  Created by Jonatan Ariel Marcos Gonzalez on 01/07/2022.
//

import Foundation
import Alamofire
@testable import SKTestapp

enum EndpointTestMock {
    case getPost
    case getPostFailure
}

extension EndpointTestMock: EndpointProtocol {
    
    var environment: NetworkEnvironment {
        .testing
    }
    
    var baseURL: URL {
        guard let url = URL(string: environment.getURL()) else {
            fatalError("Error when it wes setting a environment")
        }
        return url
    }
    
    var path: String {
        switch self {
            case .getPost:
                return "/posts"
            case .getPostFailure:
                return "/getPostFailure"
        }
    }
    
    var httpMerthod: HTTPMethod {
        return .get
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
    var params: Parameters? {
        return nil
    }
    
    var apiKey: String? {
        return nil
    }
    
    var apiAuth: Parameters? {
        return nil
    }
    
    
}

