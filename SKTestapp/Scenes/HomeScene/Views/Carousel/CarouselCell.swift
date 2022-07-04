//
//  CarouselCell.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 02/07/2022.
//

import UIKit
import AVFoundation
import AVKit

protocol CarouselCellDisplayLogic: AnyObject {
    func setCarousel(_ viewModel: CarouselViewModel)
}

class CarouselCell: UITableViewCell {
    
    static let identifier = "carouselIdentifier"
    private var viewModel: CarouselViewModel?
    
    static func nib() -> UINib {
        return UINib(nibName: "CarouselCell",
                     bundle: nil)
    }
    
    @IBOutlet weak var CarouselCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        CarouselCollectionView.register(CarouselCollectionViewCell.nib(), forCellWithReuseIdentifier: CarouselCollectionViewCell.identifier)
        self.CarouselCollectionView.delegate = self
        self.CarouselCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func playVideo(url: URL) {
        let player = AVPlayer(url: url)
        
        let vc = AVPlayerViewController()
        vc.player = player
        
    }
    
}

extension CarouselCell: UICollectionViewDelegate {
    
    
}

extension CarouselCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let carouselSize = self.viewModel?.calulateSizeByCarouselType(heightRow: self.frame.height) else {
            return CGSize(width: 100, height: 80)
        }

        return carouselSize
    }

}

extension CarouselCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel?.getNumberOfItemsInMovie() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCollectionViewCell.identifier, for: indexPath) as! CarouselCollectionViewCell
        
        if let movies = self.viewModel?.getMovies() {
            cell.setMovie(CarouselItemViewModel(movie: movies[indexPath.row]))
            cell.setupRow()
        }
        
        return cell
    }
}


extension CarouselCell: CarouselCellDisplayLogic {
    
    func setCarousel(_ viewModel: CarouselViewModel) {
        self.viewModel = viewModel
    }
}
