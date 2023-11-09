//
//  MovieManager.swift
//  TheMovieApp
//
//  Created by Berkay Sazak on 5.11.2023.
//

import Foundation

class MovieManager : MovieService {
    
    
    static let shared = MovieManager()
    
    private let apiKey = Constants.apiKey
    
    
    init() {}
    
    func searchMovies(query: String, completion: @escaping (Result<MovieSearchResponse, CustomError>) -> Void) {
        let query = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let urlString = "https://www.omdbapi.com/?s=\(query)&apikey=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                completion(.failure(.networkError))
                return
            }
            
            guard let data = data else {
                completion(.failure(.serverError))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let responseMovie = try decoder.decode(MovieSearchResponse.self, from: data)
                completion(.success(responseMovie))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    func getMovieDetails(imdbID: String, completion: @escaping (Result<Movie, CustomError>) -> Void) {
        let urlString = "https://www.omdbapi.com/?i=\(imdbID)&apikey=\(Constants.apiKey)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                completion(.failure(.decodingError))
                return
            }
            
            guard let data = data else {
                completion(.failure(.networkError))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let movieDetail = try decoder.decode(Movie.self, from: data)
                completion(.success(movieDetail))
            } catch {
                completion(.failure(.serverError))
            }
        }.resume()
    }
}
