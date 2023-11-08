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
        
        private var movieService: MockWebService!
        
        private var movieOutput: MockMovieViewModelOutput!
        private var movieDetailOutput: MockDetailViewModelOutput!

        override func setUpWithError() throws {
            movieService = MockWebService()
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
            let movie = Movie(title: "Thor", year: "2014", imdbID: "", poster: "")
        }
        func testFetchMovieDetail_whenAPISuccess_showsMovie() throws{
            let movieDetail = Movie(title: "Avangers", year: "2012", rated: "", released: "", runtime: "", genre: "", director: "", writer: "", actors: "", plot: "", language: "", country: "", awards: "", poster: "", Ratings:"" , metascore: "", imdbRating: "", imdbVotes: "", imdbID: "", type: "", dvd: "", boxOffice: "", production: "", website: "", response: "")
        }

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
}



