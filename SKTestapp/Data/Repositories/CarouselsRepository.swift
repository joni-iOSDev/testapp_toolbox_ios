//
//  CarouselsRepository.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 02/07/2022.
//

import Foundation

typealias Carousels = [CarouselEntity]

protocol CarouselsRepository {
    
    func executeGetCarouselsRequest(completionHandler: @escaping ((Result<Carousels, AppUserProviderDataErrors>) -> Void))
}

class CarouselsRepositoryImplementation: CarouselsRepository {
    
    var datasource: CarouselDataSource
    
    init(source: CarouselDataSource) {
        self.datasource = source
    }

    func executeGetCarouselsRequest(completionHandler: @escaping ((Result<Carousels, AppUserProviderDataErrors>) -> Void)) {
        
        guard let token = SessionManager.shared.getSessionToken() else {
            completionHandler(.failure(.tokenInvalid))
            return
        }
            
        datasource.getCarousels(token: token, completionHandler: completionHandler)
    }
}
