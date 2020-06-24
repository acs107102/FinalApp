//
//  TravelRow.swift
//  FinalApp
//
//  Created by Winnie on 2020/6/6.
//  Copyright © 2020 Winnie. All rights reserved.
//

import SwiftUI

struct TravelRow: View {
    @EnvironmentObject var travelListViewModel : TravelListViewModel
    var index: Int
    
    var body: some View {
        let trip = travelListViewModel.trips[index]
        return HStack {
            NetworkImage(url: trip.result_object.photo.images.original.url)
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipped()
            VStack(alignment: .leading) {
                Text(trip.result_object.name)
                    .bold()
                Text(trip.result_object.category.name)
            }
        }
    }
}

//struct TravelRow_Previews: PreviewProvider {
//    static var previews: some View {
//        TravelRow(items: Item(name: "Pattaya", latitude: "12.93439", longitude: "100.8979", timezone: "Asia/Bangkok", photo: Photo(images: Image1(original: pic(url: "https://media-cdn.tripadvisor.com/media/photo-o/15/33/fb/5c/pattaya.jpg"))), category: Category(name: "Geographic"))
//    }
//}
