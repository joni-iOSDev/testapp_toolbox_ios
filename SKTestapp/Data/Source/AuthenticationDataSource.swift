//
//  AuthenticationDataSource.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 01/07/2022.
//

import Foundation

protocol AuthenticationDataSource: AnyObject {
    func loginAPIToolBook(onSuccess: @escaping ((UserAuthentication)->Void), onFailure: @escaping (()->Void))
}

class AuthenticationDataSourceImplementation: AuthenticationDataSource {
    
    let router = Router<ToolBooxEndpoints>()

    func loginAPIToolBook(onSuccess: @escaping ((UserAuthentication)->Void), onFailure: @escaping (()->Void)) {
        
        router.request(.postAuth) { resultAuth in
            switch resultAuth {
                case .success(let dataAuth):
                    do {
                        let authDataResponseDecoded = try newJSONDecoder().decode(UserAuthenticationEntity.self, from: dataAuth)
                            onSuccess(authDataResponseDecoded)
                        
                    } catch let error {
                        onFailure()
                    }
                case .failure(_):
                    onFailure()
            }
        }
    }
}
