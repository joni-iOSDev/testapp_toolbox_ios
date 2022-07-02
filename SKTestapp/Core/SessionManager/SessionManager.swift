//
//  SessionManager.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 02/07/2022.
//

import Foundation

fileprivate struct Constants {
    static let kToken = "TOKEN_API"
    static let kType = "TYPE"
}

typealias SessionToken = String
typealias SessionType = String
typealias TokenSession = (SessionType, SessionToken)

final class SessionManager {
    
    static let shared = SessionManager()
    
    fileprivate var userAuthentication: UserAuthentication?
    
    init() {
        print("Singleton initialized")

    }
    
    func getSessionToken() -> TokenSession? {
        guard let token = UserDefaults.standard.value(forKey: Constants.kToken) as? String,
              let type = UserDefaults.standard.value(forKey: Constants.kType) as? String else {
                  return nil
              }
        
        return (type, token)
    }
    
    func setAuthetication(auth: UserAuthentication) {
        self.userAuthentication = auth
        saveToken()
    }
    
    private func saveToken() {
        guard let userAuth = self.userAuthentication else { return }
        UserDefaults.standard.set(userAuth.token, forKey: Constants.kToken)
        UserDefaults.standard.set(userAuth.type, forKey: Constants.kType)
        print("APP123 Token saved!")

    }
    
    private func deleteToken() {
        UserDefaults.standard.removeObject(forKey: Constants.kType)
        UserDefaults.standard.removeObject(forKey: Constants.kToken)
    }
    
    func isLogged() -> Bool {
        return self.getSessionToken() != nil
    }
    
    func signOut(done: @escaping (() -> Void)){
        self.userAuthentication = nil
        deleteToken()
        done()
    }
}
