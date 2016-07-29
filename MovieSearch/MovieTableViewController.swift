//
//  MovieTableViewController.swift
//  MovieSearch
//
//  Created by Travis Sasselli on 7/29/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController, UISearchBarDelegate {

    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return movies.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("movieCell", forIndexPath: indexPath) as? MovieDetailTableViewCell
        
        let movie = movies[indexPath.row]
        
        cell?.updateWithMovie(movie)
        
        return cell ?? UITableViewCell()
    }
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        MovieController.searchForMovie(searchTerm) { (movies) in
            guard let movies = movies else { return }
            self.movies = movies
            self.tableView.reloadData()
        }
    }

  }
