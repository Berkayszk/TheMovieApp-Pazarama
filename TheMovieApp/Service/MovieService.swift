//
//  MovieService.swift
//  TheMovieApp
//
//  Created by Berkay Sazak on 5.11.2023.
//

import Foundation
protocol MovieService {
    
    func searchMovies(query: String, completion: @escaping (Result<[Movie], CustomError>) -> Void)
    func getMovieDetails(imdbID: String, completion: @escaping (Result<Movie, CustomError>) -> Void)
}
