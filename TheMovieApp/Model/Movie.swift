//
//  Movie.swift
//  TheMovieApp
//
//  Created by Berkay Sazak on 5.11.2023.
//

import Foundation
struct Movie: Codable {
    
    let Poster: String?
    let Title: String?
    let Year: String?
    let Rated: String?
    let Released: String?
    let Runtime: String?
    let Genre: String?
    let Director: String?
    let Language: String?
    let Country: String?
    let BoxOffice: String?
    let Metascore: String?
    let imdbRating: String?
    let imdbVotes: String?
    let imdbID: String?
    let Plot: String?
    
    
    
}

struct MovieSearchResponse: Codable {
    let search: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case search = "Search"
    }
}
