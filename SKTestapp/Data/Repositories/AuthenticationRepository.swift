//
//  AuthRepository.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 01/07/2022.
//

import Foundation

protocol AuthenticationRepository: AnyObject {
    func loginRequest(with credentials: UserCredentials, completionHandler: @escaping ((Result<UserAuthentication, AppUserCredentialErrors>)->Void))
}

class AuthenticationRepositoryImplementation: AuthenticationRepository {
    
    private var datasource: AuthenticationDataSource
    
    init(source: AuthenticationDataSource) {
        self.datasource = source
    }
    
    func loginRequest(with credentials: UserCredentials, completionHandler: @escaping ((Result<UserAuthentication, AppUserCredentialErrors>)->Void)) {
        
        datasource.loginAPIToolBook(onSuccess: { userAuthenticationEntity in
            completionHandler(.success(userAuthenticationEntity))
        }, onFailure: {
            completionHandler(.failure(.invalidCredentials))
        })
    }
}
