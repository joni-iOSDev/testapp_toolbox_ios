//
//  Movie.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 02/07/2022.
//

import Foundation

class Movie: Codable {
    
    let title: String
    let imageURL: String
    let videoURL: String?
    let description: String
    
    init(title: String, imageURL: String, videoURL: String?, description: String) {
        self.title = title
        self.imageURL = imageURL
        self.videoURL = videoURL
        self.description = description
    }
        
}
