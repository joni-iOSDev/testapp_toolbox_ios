//
//  MoviesEntity.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 02/07/2022.
//

import Foundation

class MovieEntity: Movie {
    
    let movieTitle: String
    let movieImageURL: String
    let movieVideoURL: String?
    let movieDescription: String
    
    enum CodingKeys: String, CodingKey {
        case title, imageUrl, videoUrl, description
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.movieTitle = try container.decode(String.self, forKey: .title)
        self.movieImageURL = try container.decode(String.self, forKey: .imageUrl)
        self.movieVideoURL = try? container.decode(String.self, forKey: .videoUrl)
        self.movieDescription = try container.decode(String.self, forKey: .description)
        super.init(title: movieTitle, imageURL: movieImageURL, videoURL: movieVideoURL, description: movieDescription)
    }
}
