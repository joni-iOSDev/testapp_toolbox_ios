//
//  HomeViewModel.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 02/07/2022.
//

import Foundation
import CoreGraphics

fileprivate struct Constants {
    static let title = "Home"
}

class HomeViewModel {
    
    private let presenter: HomePresenter
    
    init(presenter: HomePresenter) {
        self.presenter = presenter
    }
    
    func rows() -> Int {
        return presenter.getCountList()
    }
    
    func titleViewController() -> String {
        return Constants.title
    }
    
    static func heightTableViewCell() -> CGFloat {
        return 200
    }
}
