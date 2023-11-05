//
//  DetailViewModelOutput.swift
//  TheMovieApp
//
//  Created by Berkay Sazak on 6.11.2023.
//

import Foundation

protocol DetailViewModelOutput : AnyObject {
    func setMovieDetails(movie: Movie?, error: String?)
}
