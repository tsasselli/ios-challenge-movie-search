//
//  MovieController.swift
//  MovieSearch
//
//  Created by Travis Sasselli on 7/29/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class MovieController {
    
    init(){
        MovieController.searchForMovie("superman") { (movies) in
            //
        }
    }
    
    static let baseURL = NSURL(string: "http://api.themoviedb.org/3/search/movie")
    static private let apiKey = "39b3b8ccedabe0c9373ba3b32a814d13"
    
    static func searchForMovie(search: String, completion: (movies: [Movie]?) -> Void) {
        guard let url = baseURL else {
            print("Error: URL did not load")
            completion(movies: nil)
            return
        }
        let urlParamaters = ["query" : search.lowercaseString, "api_key" : apiKey]
        
        NetworkController.performRequestForURL(url, httpMethod: .Get, urlParameters: urlParamaters) { (data, error) in
            guard let data = data,
                responseDataString = NSString(data: data, encoding: NSUTF8StringEncoding) else {
                    print("Error: Unable to obtain data /n\(error?.localizedDescription)")
                    completion(movies: [])
                    return
            }
            guard let jsonDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String: AnyObject] else {
                print ("Error: Unable to serialize JSON. n/\(responseDataString)")
                completion(movies: [])
                return
            }
            guard let moviesArray = jsonDictionary["results"] as? [[String : AnyObject]] else { return }
            
            dispatch_async(dispatch_get_main_queue()) {
                let movies = moviesArray.flatMap{ Movie(dictionary: $0) }
                completion(movies: movies)
            }
        }
        
    }
    
}