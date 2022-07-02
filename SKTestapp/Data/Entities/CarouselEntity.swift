//
//  CarouselEntity.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 02/07/2022.
//

import Foundation

class CarouselEntity: Carousel {
    let carouselTitle: String
    let carouselType: String
    let carouselItems: [MovieEntity]
    
    enum CodingKeys: String, CodingKey {
        case title, type, items
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.carouselTitle = try container.decode(String.self, forKey: .title)
        self.carouselType = try container.decode(String.self, forKey: .type)
        self.carouselItems = try container.decode([MovieEntity].self, forKey: .items)
        super.init(title: carouselTitle, type: carouselType, items: carouselItems)
    }
}
