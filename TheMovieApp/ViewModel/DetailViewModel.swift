//
//  DetailViewModel.swift
//  TheMovieApp
//
//  Created by Berkay Sazak on 6.11.2023.
//

import Foundation

class DetailViewModel {
    
    private let webService : MovieService?
    
    var detailOutput : DetailViewModelOutput?
    
    init(webService: MovieService?) {
        self.webService = webService
    }
    
    func getMovie(id: String){
        webService?.getMovieDetails(imdbID: id, completion: { result in
                switch result {
                case .success(let movie):
                    print("Movies:", movie)
                    self.detailOutput?.setMovieDetails(movie: movie, error: "Error!")
                case .failure(let customError):
                    switch customError{
                    case .decodingError:
                        self.detailOutput?.setMovieDetails(movie: nil, error: "Error Decoding")
                    case .networkError:
                        self.detailOutput?.setMovieDetails(movie: nil, error: "Error Network")
                    case .serverError:
                        self.detailOutput?.setMovieDetails(movie: nil, error: "Error Server")
                    case .urlError:
                        self.detailOutput?.setMovieDetails(movie: nil, error: "Error Url")
                    }
                }
            
        })
    }
}



