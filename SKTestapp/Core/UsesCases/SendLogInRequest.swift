//
//  SendLoginRequestUseCase.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 01/07/2022.
//

import Foundation

typealias SendLoginRequestUseCaseResult = Result<[String:Any], Error>
/// Use Case
class SendLoginRequestUseCase {
    
    var repository: AuthenticationRepository?
    
    func executeRequest(_ credentials: UserCredentials,_ complemtionHandler: @escaping ((SendLoginRequestUseCaseResult) -> Void)) {
        repository?.loginRequest(with: credentials, completionHandler: {
            
        })
    }
}
