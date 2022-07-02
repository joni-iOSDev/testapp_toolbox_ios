//
//  NetworkEnvironment.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 01/07/2022.
//

import Foundation

fileprivate struct constants {
    static let developUrl = "https://echo-serv.tbxnet.com"
}

public enum NetworkEnvironment {
    case mock
    case prod
    case develop
    case testing
    
    public func getURL() -> String {
        switch self {
            case .develop:
                return constants.developUrl
            case .mock:
                return ""
            case .prod:
                return "https://prod.prod.com"
            case .testing:
                return "https://jsonplaceholder.typicode.com"
        }
    }
}
