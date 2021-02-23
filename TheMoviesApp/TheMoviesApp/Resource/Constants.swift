//
//  Constants.swift
//  TheMoviesApp
//
//  Created by Sach on 13/02/21.
//

import Foundation

struct Constants {
    
    static let apiKey = "?api_key=4973ce1a9f09019558e279f4d336a04e"
        
    struct MainUrl {
        static let main = "https://api.themoviedb.org/3/"
        static let urlImages = "https://image.tmdb.org/t/p/w200"
    }
    
    struct EndPoints {
        static let urlListPopularMovies = "movie/popular"
        
        static let urlDetailMovie = "movie/"
    }
    
}
