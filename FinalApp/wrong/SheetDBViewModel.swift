//
//  SheetDBViewModel.swift
//  FinalApp
//
//  Created by Winnie on 2020/6/16.
//  Copyright © 2020 Winnie. All rights reserved.
//

import Foundation
import Combine

class SheetDBViewModel: ObservableObject {
//    var request = URLRequest(url: URL(string: "https://sheetdb.io/api/v1/metqxis6dbjd4")!,timeoutInterval: Double.infinity)
//    request.addValue("__cfduid=d9938698e124c1d10670a4878f1d411481591797896", forHTTPHeaderField: "Cookie")
//
//    request.httpMethod = "Post"
//
//    let task = URLSession.shared.dataTask(with: request) { data, response, error in
//      guard let data = data else {
//        print(String(describing: error))
//        return
//      }
//      print(String(data: data, encoding: .utf8)!)
//    }
//
//    task.resume()
}



struct SheetDB: Identifiable, Codable {
    var id = UUID()
    var name: String
    var place: String
    var date: String //Date
    var daytravel: Int
    var airplane: String
    var airline: String
    var AirClass: String
}
