//
//  MovieViewModelDelegate.swift
//  TheMovieApp
//
//  Created by Berkay Sazak on 6.11.2023.
//

import Foundation

protocol MovieViewModelOutput : AnyObject {
    func setSearchMovie(movieList: MovieSearchResponse, error: String?)
}
