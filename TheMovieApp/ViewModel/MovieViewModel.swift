//
//  MovieViewModel.swift
//  TheMovieApp
//
//  Created by Berkay Sazak on 6.11.2023.
//

import Foundation
class MovieViewModel {
  
    private let webService : MovieService?
    
    var movieOutput : MovieViewModelOutput?
    
    init(webService: MovieService) {
        self.webService = webService
    }
    
    func fetchMovieSearchs(movieName: String){
        webService?.searchMovies(query: movieName, completion: { result in
        
                switch result {
                case .success(let movieResult):
                    self.movieOutput?.setSearchMovie(movieList: movieResult, error: nil)
                case .failure(let customError):
                    switch customError{
                    case .decodingError:
                        self.movieOutput?.setSearchMovie(movieList: MovieSearchResponse(search: []), error: "Decoding error.")
                    case .networkError:
                        self.movieOutput?.setSearchMovie(movieList: MovieSearchResponse(search: []), error: "Network error.")
                    case .serverError:
                        self.movieOutput?.setSearchMovie(movieList: MovieSearchResponse(search: []), error: "Server error.")
                    case .urlError:
                        self.movieOutput?.setSearchMovie(movieList: MovieSearchResponse(search: []), error: "Url error.")
                    }
                }
            
        })
    }                                 
}
