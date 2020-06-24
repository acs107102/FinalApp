//
//  TravelListViewModel.swift
//  FinalApp
//
//  Created by Winnie on 2020/6/6.
//  Copyright © 2020 Winnie. All rights reserved.
//

import Foundation

class TravelListViewModel: ObservableObject {
    
    @Published var trips = [Trip]()
    
    func fetchTravels(name: String) {
        var request = URLRequest(url: URL(string: "https://tripadvisor1.p.rapidapi.com/locations/search?location_id=1&limit=30&sort=relevance&offset=0&lang=en_US&currency=USD&units=km&query=\(name)")!,timeoutInterval: Double.infinity)
//        request.addValue("59ef739aebmsh7d5c3e5b31caab6p17e78ejsnd008b0384ce0", forHTTPHeaderField: "x-rapidapi-key")    // google
        request.addValue("bd445b299emsh0095a070a475a7fp1065afjsn3d5322a7fc8c", forHTTPHeaderField: "x-rapidapi-key")    // NTCU

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
          let decoder = JSONDecoder()
          decoder.dateDecodingStrategy = .iso8601
            if let data = data // {
//            do {
                ,let travelResults = try? decoder.decode(TripResults.self, from: data) {
              DispatchQueue.main.async {
                  self.trips = travelResults.data

              }
        }
//                print(travelResults)
//            }catch{print(error)}
//            }
        }

        task.resume()
        
    }
}
