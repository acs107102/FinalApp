//
//  PhotoViewModel.swift
//  FinalApp
//
//  Created by Winnie on 2020/6/17.
//  Copyright © 2020 Winnie. All rights reserved.
//

import Foundation
import Combine

class PhotoViewModel: ObservableObject {

    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    @Published var photos = [Picture]() {
        didSet {
            if let data = try? PropertyListEncoder().encode(photos) {
                let url = PhotoViewModel.documentsDirectory.appendingPathComponent("photos")
                try? data.write(to: url)
            }
        }
    }
    
    init() {
        let url = PhotoViewModel.documentsDirectory.appendingPathComponent("photos")
        if let data = try? Data(contentsOf: url), let array = try?  PropertyListDecoder().decode([Picture].self, from: data) {
            photos = array
        }
    }
}

struct Picture: Identifiable, Codable {
    var id = UUID()
    var content: String
    var imageName: String
    var imagePath: String {
        return PhotoViewModel.documentsDirectory.appendingPathComponent(imageName).path
    }
}
