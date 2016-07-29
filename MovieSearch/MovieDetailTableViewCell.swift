//
//  MovieDetailTableViewCell.swift
//  MovieSearch
//
//  Created by Travis Sasselli on 7/29/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class MovieDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateWithMovie(movie: Movie) {
        titleLabel.text = movie.title
        ratingLabel.text = "Rating: \(movie.rating)"
        overviewLabel.text = movie.overview
        
        ImageController.imageForURL(movie.poster) { (image) in
            guard let image = image else { return }
            self.posterImageView.image = image
        }
    }
}

        
