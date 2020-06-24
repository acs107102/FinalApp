//
//  data.swift
//  FinalApp
//
//  Created by Winnie on 2020/6/6.
//  Copyright © 2020 Winnie. All rights reserved.
//

import Foundation

struct TripResults: Codable {
   let data: [Trip]
}

struct Trip: Codable {
    let result_type: String
    let result_object: Item
}

struct Item: Codable {
    let name: String
    let latitude: String
    let longitude: String
    let timezone: String
    let location_string: String
    let photo: Photo
    let rating: String?
    let category: Category
    let geo_description: String?
    let address: String?
    
}

struct Photo: Codable {
    let images: Image1
}

struct Image1: Codable {
    let original: pic
}

struct pic: Codable {
    let url: URL
}

struct Category: Codable {
    let name: String
}
