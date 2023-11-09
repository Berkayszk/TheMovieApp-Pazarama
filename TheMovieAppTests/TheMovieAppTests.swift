//
//  TheMovieAppTests.swift
//  TheMovieAppTests
//
//  Created by Berkay Sazak on 5.11.2023.
//

import XCTest
@testable import TheMovieApp

final class TheMovieAppTests: XCTestCase {

        private var movieViewModel: MovieViewModel!
        private var detailViewModel: DetailViewModel!
        
        private var movieService: MockMovieService!
        
        private var movieOutput: MockMovieViewModelOutput!
        private var movieDetailOutput: MockDetailViewModelOutput!

        override func setUpWithError() throws {
            movieService = MockMovieService()
            movieViewModel = MovieViewModel(webService: movieService)
            movieOutput = MockMovieViewModelOutput()
            movieViewModel.movieOutput = movieOutput
            
            detailViewModel = DetailViewModel(webService: movieService)
            movieDetailOutput = MockDetailViewModelOutput()
            detailViewModel.detailOutput = movieDetailOutput
            
            
        }
        
        override func tearDownWithError() throws {
            movieViewModel = nil
            detailViewModel = nil
            movieService = nil
        }

        func testFetchMovie_whenAPISuccess_showsMovie() throws{
            let mockMovie = MovieSearchResponse(search: [
                Movie(Poster: "www", Title: "Avengers", Year: "2014", Rated: "asd", Released: "asd", Runtime: "asd", Genre: "asd", Director: "asd", Language: "asd", Country: "", BoxOffice: "asd", Metascore: "asd", imdbRating: "asd", imdbVotes: "asd", imdbID: "asd", Plot: "asd"),
                Movie(Poster: "aaa", Title: "Batman", Year: "2012", Rated: "asd", Released: "asd", Runtime: "asd", Genre: "asd", Director: "asd", Language: "asd", Country: "", BoxOffice: "asd", Metascore: "asd", imdbRating: "asd", imdbVotes: "asd", imdbID: "asd", Plot: "asd")])
                    
            
            movieService.fetchMovieMockResult = .success(mockMovie)
            
            movieViewModel.fetchMovieSearchs(movieName: "Avengers")
            
            XCTAssertEqual(movieOutput.searchMovie?.search[0].Poster, "www")
            XCTAssertEqual(movieOutput.searchMovie?.search[0].Title, "Avengers")
            XCTAssertEqual(movieOutput.searchMovie?.search[0].Year, "2014")
            XCTAssertEqual(movieOutput.searchMovie?.search[1].Poster, "aaa")
            XCTAssertEqual(movieOutput.searchMovie?.search[1].Title, "Batman")
            XCTAssertEqual(movieOutput.searchMovie?.search[1].Year, "2012")
        }
        func testFetchMovieDetail_whenAPISuccess_showsMovieDetail() throws{
            let mockMovieDetails = Movie(Poster: "www", Title: "Avengers", Year: "2014", Rated: "", Released: "", Runtime: "", Genre: "", Director: "", Language: "", Country: "", BoxOffice: "", Metascore: "", imdbRating: "", imdbVotes: "", imdbID: "", Plot: "")
        
            movieService.fetchMovieMockDetails = .success(mockMovieDetails)
            
            detailViewModel.getMovie(id: "1")
            
            XCTAssertEqual(movieDetailOutput.movie?.Poster, "www")
            XCTAssertEqual(movieDetailOutput.movie?.Title, "Avengers")
            XCTAssertEqual(movieDetailOutput.movie?.Year, "2014")
        }

    class MockMovieService : MovieService {
        
        var fetchMovieMockResult : Result<MovieSearchResponse, TheMovieApp.CustomError>?
        var fetchMovieMockDetails : Result<TheMovieApp.Movie, TheMovieApp.CustomError>?
        
        func searchMovies(query: String, completion: @escaping (Result<MovieSearchResponse, TheMovieApp.CustomError>) -> Void) {
            if let result = fetchMovieMockResult {
                completion(result)
            }
        }
        
        func getMovieDetails(imdbID: String, completion: @escaping (Result<TheMovieApp.Movie, TheMovieApp.CustomError>) -> Void) {
            if let result = fetchMovieMockDetails {
                completion(result)
            }
        }
    }
    class MockMovieViewModelOutput : MovieViewModelOutput {
        var searchMovie : MovieSearchResponse?
        func setSearchMovie(movieList: MovieSearchResponse, error: String?) {
            self.searchMovie = movieList
        }
    }
    
    class MockDetailViewModelOutput : DetailViewModelOutput {
        var movie : Movie?
        func setMovieDetails(movie: TheMovieApp.Movie?, error: String?) {
            self.movie = movie
        }
    }
    
    /*
    class MockWebService : MovieService {
        var fetchSearchMovieMockResult: Result<[Movie], CustomError>?
        var fetchMovieDetailMockResult: Result<Movie, CustomError>?
        func searchMovies(query: String, completion: @escaping (Result<[TheMovieApp.Movie], TheMovieApp.CustomError>) -> Void) {
            if let result = fetchSearchMovieMockResult {
                completion(result)
            }
        }
        
        func getMovieDetails(imdbID: String, completion: @escaping (Result<TheMovieApp.Movie, TheMovieApp.CustomError>) -> Void) {
            if let result = fetchMovieDetailMockResult{
                completion(result)
            }
        }
        }
        
    class MockMovieViewModelOutput : MovieViewModelOutput {
        var movie: Movie?
        func setSearchMovie(movieList: [TheMovieApp.Movie]?, error: String?) {
            if let movie {
                self.movie = movie
            }
        }
    }
        class MockDetailViewModelOutput : DetailViewModelOutput {
            var movieDetail: Movie?
            func setMovieDetails(movie: Movie?, error: String?) {
                if let movieDetail{
                    self.movieDetail = movieDetail
                }
            }
            
            
        }
     */
}



