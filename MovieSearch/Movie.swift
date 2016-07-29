//
//  Movie.swift
//  MovieSearch
//
//  Created by Travis Sasselli on 7/29/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Movie {
    
    private let kTitle = "title"
    private let kRating = "vote_average"
    private let kOverview = "overview"
    private let kPoster = "poster_path"
    
    let title: String
    let rating: Double
    let overview: String
    let poster: String

    init? (dictionary: [String: AnyObject]) {
        guard let title = dictionary[kTitle] as? String,
            rating = dictionary[kRating] as? Double,
            overview = dictionary[kOverview] as? String,
            poster = dictionary[kPoster] as? String else { return nil }
        
        guard let imageURL = NSURL(string: "http://image.tmdb.org/t/p/w500")?.URLByAppendingPathComponent(poster) else { return nil}

        self.rating = rating
        self.title = title
        self.overview = overview
        self.poster = String(imageURL)
    }
    
    
    
    
}