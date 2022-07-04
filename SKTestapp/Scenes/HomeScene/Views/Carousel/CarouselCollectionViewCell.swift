//
//  CarouselCollectionViewCell.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 02/07/2022.
//

import UIKit
import Kingfisher


protocol CarouselCollectionViewCellDisplayLogic: AnyObject {
    func setMovie(_ viewModel: CarouselItemViewModel)
    func setupRow()
}

class CarouselCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CarouselCollectionCellIdentifier"
    
    static func nib() -> UINib {
        return UINib(nibName: "CarouselCollectionViewCell",
                     bundle: nil)
    }

    private var viewModel: CarouselItemViewModel?
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

}

extension CarouselCollectionViewCell: CarouselCollectionViewCellDisplayLogic {
    
    func setMovie(_ viewModel: CarouselItemViewModel) {
        self.viewModel = viewModel
    }
    
    private func setImageView() {
        if let imageUrl = self.viewModel?.getImageMovieUrl() {
            self.imageView.kf.setImage(with: imageUrl)
        }
    }
    
    private func setMovieTitle() {
        if let title = self.viewModel?.geMovieTitle() {
            self.movieTitle.text = title
            self.movieTitle.font = .preferredFont(forTextStyle: .title1)
            self.movieTitle.adjustsFontForContentSizeCategory = true
        }
    }
    
    private func setMovieDescription() {
        if let description = self.viewModel?.geMovieDescription() {
            self.movieDescription.text = description
            self.movieDescription.font = .preferredFont(forTextStyle: .body)
            self.movieDescription.adjustsFontForContentSizeCategory = true
        }
    }
    
    
    func getVideoURL() -> URL?{
        return self.viewModel?.getVideoMovieUrl()
    }
    
    func setupRow() {
        self.setImageView()
        self.setMovieTitle()
        self.setMovieDescription()
    }
    
}
