//
//  AuthenticationDataSource.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 01/07/2022.
//

import Foundation

protocol AuthenticationDataSource: AnyObject {
    func loginAPIToolBook(onSuccess: @escaping (()->Void), onFailure: @escaping (()->Void))
}

class AuthenticationDataSourceImplementation: AuthenticationDataSource {
    
    func loginAPIToolBook(onSuccess: @escaping (()->Void), onFailure: @escaping (()->Void)) {
        
        let router = Router<ToolBooxEndpoints>()
        
        router.request(.auth) { resultAuth in
            switch resultAuth {
                case .success(let dataAuth):
                    print("login")
                    onSuccess()
                case .failure(let error):
                    print("ups algo paso")
                    onFailure()
            }
        }
    }
}
