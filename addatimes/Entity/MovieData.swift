//
//  MovieData.swift
//  addatimes
//
//  Created by shubham on 22/05/21.
//

import Foundation

struct MovieData: Codable {

    let success: Bool
    let data: [DataM]
}

struct DataM: Codable {

    let title: String?
    let items: [Items]
    let banners: [Banners]
    let genres: [Geners]
    let category_id: Int
    let collection_id: Int
    let continue_watching: String? // null all the time
    let slug: String
    let top_banner: Top_Banner
}

struct Geners: Codable {
    let title: String
    let image: URL
    let slug: String
}

struct Top_Banner: Codable {
    let image: URL
    let slug: String
    let trailer_id: String
    let id: Int? // null all teh time
    let video: URL
    let type: Int
}

struct Items: Codable {
    let id: Int
    let slug: String
    let brightcove_trailer_id: String
    let category_slug: String
    let vertical_image: URL
    let horizontal_image: URL
    let type: Int
}

struct Banners: Codable {
    let id : Int
    let banner_id : Int
    let image : URL
    let image_order : Int
    let url : String
}
