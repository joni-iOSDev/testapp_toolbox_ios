//
//  UserCredentials.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 01/07/2022.
//

import Foundation

typealias UserCredentialEncoded = (String, passwordEncoded?)

struct UserCredentials {
    var username: String
    var password: String
}

extension UserCredentials {
    func encodingCredentials() -> UserCredentialEncoded {
        return (self.username, self.password.data(using: String.Encoding.utf8))
    }
}
