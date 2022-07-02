//
//  Carousel.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 02/07/2022.
//

import Foundation

class Carousel: Codable {
    
    let title, type: String
    let items: [Movie]
    
    init(title: String, type: String, items: [Movie]) {
        self.title = title
        self.type = type
        self.items = items
    }
}
