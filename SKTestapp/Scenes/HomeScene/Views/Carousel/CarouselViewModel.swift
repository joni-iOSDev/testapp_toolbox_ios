//
//  CarouselViewModel.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 03/07/2022.
//

import Foundation
import CoreGraphics
typealias UrlOpenCallback = (URL) -> Void

fileprivate struct Constants {
    static let thumb = "thumb"
    static let poster = "poster"

}

final class CarouselViewModel {
    
    private let carousel: Carousel
    
    init(courselModel: Carousel) {
        self.carousel = courselModel
    }
    
    func getCarouselType() -> CarouselType {
        
        if carousel.type == Constants.thumb {
            return .poster
        }
        
        return .thumb
    }
    
    func getNumberOfItemsInMovie() -> Int {
        return self.carousel.items.count
    }
    
    
    func calulateSizeByCarouselType(heightRow: CGFloat) -> CGSize {
        let widthThumb = heightRow + (heightRow * 30 / 100)
        let widthPoster = heightRow - (heightRow * 30 / 100)
        let finalWidth = getCarouselType() == .poster ? widthPoster : widthThumb
        return CGSize(width: finalWidth, height: heightRow)
    }
    
    func getMovies() -> [Movie] {
        return self.carousel.items
    }
    
    
    
}

enum CarouselType {
    case thumb, poster
}
