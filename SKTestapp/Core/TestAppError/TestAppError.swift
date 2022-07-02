//
//  TestAppError.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 01/07/2022.
//

import Foundation

enum AppErrorsType: String, Error {
    case failure = "General Error"
    case errorConexion = "Bad conextion"
    case routerError = "Error during the request"
    case invalidCredentials = "Invalid username or password"
}

enum AppUserCredentialErrors: String, Error {
    case invalidCredentials = "Invalid username or password"
}

enum AppUserProviderDataErrors: String, Error {
    case tokenInvalid = "Bad conextion with you session"
    case invalidRequestGetCarousels = "An error occurred when we called the api"
}
