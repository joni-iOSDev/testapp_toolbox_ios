//
//  LogInPresenter.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 01/07/2022.
//

import Foundation

protocol LogInPresenter: AnyObject {
    func viewDidLoad()
    func requestLogin(credentials: UserCredentials)
    func credentialsValidation(with username: String?, password: String?) throws -> UserCredentials
}
