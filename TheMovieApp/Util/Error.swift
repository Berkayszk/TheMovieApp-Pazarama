//
//  Error.swift
//  TheMovieApp
//
//  Created by Berkay Sazak on 6.11.2023.
//

import Foundation
enum CustomError: Error {
    case decodingError
    case urlError
    case networkError
    case serverError
}
