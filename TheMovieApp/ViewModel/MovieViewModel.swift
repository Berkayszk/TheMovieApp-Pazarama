//
//  MovieViewModel.swift
//  TheMovieApp
//
//  Created by Berkay Sazak on 6.11.2023.
//

import Foundation
class MovieViewModel {
    
    let webService2 = "test"
    private let webService : MovieService?
    
    var movieOutput : MovieViewModelOutput?
    
    init(webService: MovieService) {
        self.webService = webService
    }
    /*
    func searchMovie(movieName: String) {
        webService?.searchMovies(query: movieName, completion: { result in
            //Error section will be added.
            switch result{
            case .success(let movie):
                self.movieOutput?.setSearchMovie(movieList: movie, error: nil)
            case.failure(let error):
                self.movieOutput?.setSearchMovie(movieList: [], error: nil)
            }
        })
    }
     */
    func fetchMovieSearchs(movieName: String){
        webService?.searchMovies(query: movieName, completion: { result in
            DispatchQueue.main.async(){
                switch result {
                case .success(let movie):
                    self.movieOutput?.setSearchMovie(movieList: movie, error: nil)
                case .failure(let customError):
                    switch customError{
                    case .decodingError:
                        self.movieOutput?.setSearchMovie(movieList: nil, error: "Decoding error.")
                    case .networkError:
                        self.movieOutput?.setSearchMovie(movieList: nil, error: "Network error.")
                    case .serverError:
                        self.movieOutput?.setSearchMovie(movieList: nil, error: "Server error.")
                    case .urlError:
                        self.movieOutput?.setSearchMovie(movieList: nil, error: "Url error.")
                    }
                }
            }
        })
    }
                                 
}
                                

