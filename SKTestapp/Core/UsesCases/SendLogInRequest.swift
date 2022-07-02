//
//  SendLoginRequestUseCase.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 01/07/2022.
//

import Foundation

/// Use Case
class SendLoginRequestUseCase {
    
    var repository: AuthenticationRepository
    
    init(repository: AuthenticationRepository) {
        self.repository = repository
    }
    func executeRequest(_ credentials: UserCredentials,_ complemtionHandler: @escaping ((Result<UserAuthentication, AppUserCredentialErrors>) -> Void)) {
        repository.loginRequest(with: credentials, completionHandler: complemtionHandler)
    }
    

}
