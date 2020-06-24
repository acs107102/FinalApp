//
//  TaipeiData.swift
//  FinalApp
//
//  Created by Winnie on 2020/6/21.
//  Copyright © 2020 Winnie. All rights reserved.
//

import Foundation

struct TaipeiData: Codable {
    let data: [Taipei]
}

struct Taipei: Codable {
    let id: Int
    let name: String
    let introduction: String
    let open_time:String?
    let distric: String
    let address: String
    let tel: String
//    let email: String
    let nlat: Double
    let elong: Double
    let official_site: String?
//    let facebook: URL?
    let ticket: String?
    let remind: String?
    let images: [pic1]?
}

struct pic1: Codable {
    let src: URL
}
