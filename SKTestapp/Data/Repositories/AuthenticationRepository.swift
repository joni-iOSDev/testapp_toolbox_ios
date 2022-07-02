//
//  AuthRepository.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 01/07/2022.
//

import Foundation

protocol AuthenticationRepository: AnyObject {
    func loginRequest(with credentials: UserCredentials, completionHandler: @escaping (()->Void))
}

class AuthenticationRepositoryImplementation: AuthenticationRepository {
    
    var datasource: AuthenticationDataSource?
    
    func loginRequest(with credentials: UserCredentials, completionHandler: @escaping (()->Void)) {
        datasource?.loginAPIToolBook(onSuccess: {
            
        }, onFailure: {
            
        })
    }
}
