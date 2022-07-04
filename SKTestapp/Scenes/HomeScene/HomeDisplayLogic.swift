//
//  HomeDisplayLogic.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 02/07/2022.
//

import Foundation

protocol HomeDisplayLogic: AnyObject {
    func configureSigOutButton()
    func closeScene()
    func showFailureLogin(with message: String)
    func registerCell()
    func refreshTableView()
    func setupUI()

}
