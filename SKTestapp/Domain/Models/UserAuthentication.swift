//
//  AuthResponseData.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 02/07/2022.
//

import Foundation

class UserAuthentication: Codable {
    
    let sub, token, type: String
    
    init(sub: String, token: String, type: String) {
        self.sub = sub
        self.token = token
        self.type = type
    }
}
