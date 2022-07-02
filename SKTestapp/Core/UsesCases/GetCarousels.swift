//
//  GetCarouselsUseCase.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 02/07/2022.
//

import Foundation

class GetCarouselsUseCase {
    
    private var repository: CarouselsRepository
    
    init(repository: CarouselsRepository) {
        self.repository = repository
    }
    
    func executeUseCase(completionHandler: @escaping ((Result<Carousels, AppUserProviderDataErrors>) -> Void)) {
        repository.executeGetCarouselsRequest(completionHandler: completionHandler)
    }
}
