//
//  LogInDisplayLogic.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 01/07/2022.
//

import Foundation

protocol LogInDisplayLogic: AnyObject {
    func showFailureLogin(with message: String)
    func showNextScene()
}
