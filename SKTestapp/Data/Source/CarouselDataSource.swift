//
//  CarouselDataSource.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 02/07/2022.
//

import Foundation

protocol CarouselDataSource: AnyObject {
    func getCarousels(token: TokenSession, completionHandler: @escaping ((Result<Carousels, AppUserProviderDataErrors>) -> Void))
}

class CarouselsDataSourceImplementation: CarouselDataSource {
    
    let router = Router<ToolBooxEndpoints>()
    
    func getCarousels(token: TokenSession, completionHandler: @escaping ((Result<Carousels, AppUserProviderDataErrors>) -> Void)) {
        
        router.request(.getCarousels(token: token)) { carouselsDataResponse in
            
            switch carouselsDataResponse {
                case .success(let carouselsData):
                    do {
                        let carousels = try newJSONDecoder().decode([CarouselEntity].self, from: carouselsData)
                        completionHandler(.success(carousels))
                    } catch {
                        completionHandler(.failure(.invalidRequestGetCarousels))
                    }
                case .failure(_):
                    completionHandler(.failure(.invalidRequestGetCarousels))
            }
        }
    }
    
    
}
