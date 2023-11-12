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
                    self.detailOutput?.setMovieDetails(movie: movie, error: nil)
                case .failure(let customError):
                    let defaultMovie = Movie(Poster: "", Title: "", Year: "", Rated: "", Released: "", Runtime: "", Genre: "", Director: "", Language: "", Country: "", BoxOffice: "", Metascore: "", imdbRating: "", imdbVotes: "", imdbID: "", Plot: "")
                    let errorMessage: String
                    switch customError {
                    case .decodingError: errorMessage = "Error Decoding"
                    case .networkError: errorMessage = "Error Network"
                    case .serverError: errorMessage = "Error Server"
                    case .urlError: errorMessage = "Error Url"
                    }
                    self.detailOutput?.setMovieDetails(movie: defaultMovie, error: errorMessage)
                }
        })
    }
}

/* Solution 2
switch customError{
case .decodingError:
    self.detailOutput?.setMovieDetails(movie: Movie(Poster: "", Title: "", Year: "", Rated: "", Released: "", Runtime: "", Genre: "", Director: "", Language: "", Country: "", BoxOffice: "", Metascore: "", imdbRating: "", imdbVotes: "", imdbID: "", Plot: ""), error: "Error Decoding")
case .networkError:
    self.detailOutput?.setMovieDetails(movie: Movie(Poster: "", Title: "", Year: "", Rated: "", Released: "", Runtime: "", Genre: "", Director: "", Language: "", Country: "", BoxOffice: "", Metascore: "", imdbRating: "", imdbVotes: "", imdbID: "", Plot: ""), error: "Error Network")
case .serverError:
    self.detailOutput?.setMovieDetails(movie: Movie(Poster: "", Title: "", Year: "", Rated: "", Released: "", Runtime: "", Genre: "", Director: "", Language: "", Country: "", BoxOffice: "", Metascore: "", imdbRating: "", imdbVotes: "", imdbID: "", Plot: ""), error: "Error Server")
case .urlError:
    self.detailOutput?.setMovieDetails(movie: Movie(Poster: "", Title: "", Year: "", Rated: "", Released: "", Runtime: "", Genre: "", Director: "", Language: "", Country: "", BoxOffice: "", Metascore: "", imdbRating: "", imdbVotes: "", imdbID: "", Plot: ""), error: "Error Url")
}
*/
