//
//  FavoriteViewModel.swift
//  FinalApp
//
//  Created by Winnie on 2020/6/10.
//  Copyright © 2020 Winnie. All rights reserved.
//

import Foundation
import Combine

class FavoriteViewModel: ObservableObject {
    @Published var favorite = [Favorite]()
    var cancellable: AnyCancellable?
    
    init() {
    
         let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
         let url = documentsDirectory.appendingPathComponent("favorite")
    
         if let data = try? Data(contentsOf: url) {
             let decoder = JSONDecoder()
             if let decodedData = try? decoder.decode([Favorite].self, from: data) {
                 favorite = decodedData
             }
         }
    
         cancellable = $favorite
             .sink { (value) in
                 let encoder = JSONEncoder()
                 do {
                     let data = try encoder.encode(value)
                     try? data.write(to: url)
                 } catch {
    
                 }
         }
    
     }
}

struct Favorite: Identifiable, Codable{
    var id = UUID()
    var name:String
    var place: String
    var date: Date
    var dayTravel: Int
    var airport: String
    var airline: String
    var airclass: String
}
