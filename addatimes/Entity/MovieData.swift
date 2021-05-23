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

    let title: String
    let items: [Items]
    let banners: [[Banners]]
    let genres: [Genres]
    let category_id: Int
    let collection_id: Int
    let continue_watching: String
    let slug: String
    let top_banner: Top_Banner?
    
    
    enum CodingKeys: String, CodingKey {
        case title
        case genres
        case items
        case banners
        case category_id
        case collection_id
        case continue_watching
        case slug
        case top_banner
    }
    
    init(from decoder: Decoder) throws {
    
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        // if the value is missing OR not missing but has NULL decodeIfPreent will handle
        
        self.title = try values.decodeIfPresent(String.self, forKey: .title) ?? "NA"
        
        self.items = try values.decodeIfPresent([Items].self, forKey: .items) ?? []
        
        self.banners = try values.decodeIfPresent([[Banners]].self, forKey: .banners) ?? [[]]
        
        self.genres = try values.decodeIfPresent([Genres].self, forKey: .genres) ?? []
        
        self.category_id = try values.decodeIfPresent(Int.self, forKey: .category_id) ?? 0
        
        self.collection_id = try values.decodeIfPresent(Int.self, forKey: .collection_id) ?? 0
        
        self.continue_watching = try values.decodeIfPresent(String.self, forKey: .continue_watching) ?? "NA"
        
        self.slug = try values.decodeIfPresent(String.self, forKey: .slug) ?? "NA"
        
        self.top_banner = try values.decodeIfPresent(Top_Banner.self, forKey: .top_banner) ?? nil
    
    }
    
}



struct Genres: Codable {
    let title: String
    let image: String
    let slug: String
    
    
    enum CodingKeys: String, CodingKey {
        case title
        case image
        case slug
    }
    
    init(from decoder: Decoder) throws {
        // 1 - container
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.title = try values.decodeIfPresent(String.self, forKey: .title) ?? "NA"
        
        self.image = try values.decodeIfPresent(String.self, forKey: .image) ?? "NA"
       
        self.slug = try values.decodeIfPresent(String.self, forKey: .slug) ?? "NA"
    }
    
}

struct Top_Banner: Codable {
    let image: String
    let slug: String
    let trailer_id: String
    let id: Int
    let video: String
    let type: Int
    
    enum CodingKeys: String, CodingKey{
        case image
        case slug
        case trailer_id
        case id
        case video
        case type
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.image = try values.decodeIfPresent(String.self, forKey: .image) ?? "NA"
       
        self.slug = try values.decodeIfPresent(String.self, forKey: .slug) ?? "NA"
        
        self.trailer_id = try values.decodeIfPresent(String.self, forKey: .trailer_id) ?? "NA"
        
        self.id = try values.decodeIfPresent(Int.self, forKey: .id) ?? 0
        
        self.video = try values.decodeIfPresent(String.self, forKey: .video) ?? "NA"
        
        self.type = try values.decodeIfPresent(Int.self, forKey: .type) ?? 0
        
    }
    
    
}

struct Items: Codable {
    let id: Int
    let slug: String
    let brightcove_trailer_id: String
    let category_slug: String
    let vertical_image: String
    let horizontal_image: String
    let type: Int
    
    enum CodingKeys: String, CodingKey{
        case id
        case slug
        case brightcove_trailer_id
        case category_slug
        case vertical_image
        case horizontal_image
        case type
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try values.decodeIfPresent(Int.self, forKey: .id) ?? 0
       
        self.slug = try values.decodeIfPresent(String.self, forKey: .slug) ?? "NA"
        
        self.brightcove_trailer_id = try values.decodeIfPresent(String.self, forKey: .brightcove_trailer_id) ?? "NA"
        
        self.category_slug = try values.decodeIfPresent(String.self, forKey: .category_slug) ?? "NA"
        
        self.vertical_image = try values.decodeIfPresent(String.self, forKey: .vertical_image) ?? "NA"
        
        self.horizontal_image = try values.decodeIfPresent(String.self, forKey: .horizontal_image) ?? "NA"
        
        self.type = try values.decodeIfPresent(Int.self, forKey: .type) ?? 0
        
    }
}

struct Banners: Codable {
    let id : Int
    let banner_id : Int
    let image : String
    let image_order : Int
    let url : String
    
    enum CodingKeys: String, CodingKey{
        case id
        case banner_id
        case image
        case image_order
        case url
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try values.decodeIfPresent(Int.self, forKey: .id) ?? 0
       
        self.banner_id = try values.decodeIfPresent(Int.self, forKey: .banner_id) ?? 0
        
        self.image = try values.decodeIfPresent(String.self, forKey: .image) ?? "NA"
        
        self.image_order = try values.decodeIfPresent(Int.self, forKey: .image_order) ?? 0
        
        self.url = try values.decodeIfPresent(String.self, forKey: .url) ?? "NA"
        
    }
}
