//
//  AppNetworkRouter.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 01/07/2022.
//

import Foundation
import Alamofire

public typealias OnResponse = (Result<Data, AFError>) -> Void

protocol AppNetworkRouter {
    /// Generic Type
    associatedtype EndPoint: EndpointProtocol
    func request(_ route: EndPoint, onResponse: @escaping OnResponse)
}
