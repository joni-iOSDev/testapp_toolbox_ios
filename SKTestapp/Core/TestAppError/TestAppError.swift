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
    case marvelDataError = "Error with response object"
}
