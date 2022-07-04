//
//  CarouselItemViewModel.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 03/07/2022.
//

import Foundation

final class CarouselItemViewModel {
    
    private var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    func getImageMovieUrl() -> URL? {
        return URL(string: movie.imageURL)
    }
    
    func getVideoMovieUrl() -> URL? {
        guard let urlString = movie.videoURL else { return nil }
        return URL(string: urlString)
    }
    
    func geMovieTitle()  -> String {
        return movie.title
    }
    
    func geMovieDescription()  -> String {
        return movie.description
    }
    
}
