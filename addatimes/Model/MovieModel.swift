//
//  MovieModel.swift
//  addatimes
//
//  Created by shubham on 22/05/21.
//

import Foundation

struct MovieModel {
    
    let allMovies: [Section]
}

struct Section {
    
    let title: String
    let items: [item]
}

struct item {
    let id: Int
    let vertical_image: String
}
