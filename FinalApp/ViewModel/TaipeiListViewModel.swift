//
//  TaipeiListViewModel.swift
//  FinalApp
//
//  Created by Winnie on 2020/6/21.
//  Copyright © 2020 Winnie. All rights reserved.
//

import Foundation

class TaipeiListViewModel: ObservableObject, RandomAccessCollection {
    
    var startIndex: Int { TPEtrips.startIndex }
    var endIndex: Int { TPEtrips.startIndex }
    
    typealias Element = Taipei
    
    @Published var TPEtrips = [Taipei]()
    var NextPageToLoad = 1
    var CurrentyLoading = false

    init() {
        fetchTaipei()
    }
    subscript(position: Int) -> Taipei {
        return TPEtrips[position]
    }
    
    func fetchTaipei(currentItem: Taipei? = nil) {
        if !shouldLoadMoreData(currentItem: currentItem) {
            return
        }
        CurrentyLoading = true
        
        let urlBase = "https://www.travel.taipei/open-api/zh-tw/Attractions/All?page="
        let urlString = "\(urlBase)\(NextPageToLoad)"
        
        var request = URLRequest(url: URL(string: urlString)!,timeoutInterval: Double.infinity)
        
        request.addValue("application/json", forHTTPHeaderField: "accept")
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
          let decoder = JSONDecoder()
          decoder.dateDecodingStrategy = .iso8601

        if let data = data
                        ,let taipeiResults = try? decoder.decode(TaipeiData.self, from: data) {
                    DispatchQueue.main.async {
                        self.TPEtrips = taipeiResults.data
                        self.NextPageToLoad += 1
                        self.CurrentyLoading = false
                    }
                }

//                    if let data = data {
//                       do {
//                          let taipeiResults = try decoder.decode(TaipeiData.self, from: data)
//                          print(taipeiResults)
//                       } catch {
//                          print(error)
//                       }
//                    }
        }

        task.resume()
        
    }
    func shouldLoadMoreData(currentItem: Taipei? = nil) -> Bool {
        if CurrentyLoading{
            return false
        }
        
        guard let currentItem = currentItem else {
            return true
        }
        
        
        for n in (TPEtrips.count - 4)...(TPEtrips.count-1) {
            if n >= 0 && currentItem.id == TPEtrips[n].id {
                return true
            }
        }
        return false
    }
}
