//
//  HomeViewModel.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 02/07/2022.
//

import Foundation

class HomeViewModel {
    
    let presenter: HomePresenter
    
    init(presenter: HomePresenter) {
        self.presenter = presenter
    }
}
