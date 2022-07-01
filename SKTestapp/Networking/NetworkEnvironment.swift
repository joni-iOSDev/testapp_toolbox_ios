//
//  NetworkEnvironment.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 01/07/2022.
//

import Foundation

fileprivate struct constants {
    static let developUrl = "https://gateway.endpoint.com"
    static let port = ":443"
}

public enum NetworkEnvironment {
    case mock
    case prod
    case develop
    case testing
    
    public func getURL() -> String {
        switch self {
            case .develop:
                return constants.developUrl.appending(constants.port)
            case .mock:
                return ""
            case .prod:
                return "https://prod.marvel.com"
            case .testing:
                return "https://jsonplaceholder.typicode.com"
        }
    }
}
