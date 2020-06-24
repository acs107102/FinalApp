//
//  TravelDetail.swift
//  FinalApp
//
//  Created by Winnie on 2020/6/6.
//  Copyright © 2020 Winnie. All rights reserved.
//

import SwiftUI
import CoreLocation

struct TravelDetail: View {
    @EnvironmentObject var travelListViewModel : TravelListViewModel
    var index: Int
    
    var body: some View {
        let trip = travelListViewModel.trips[index]
        let latitude = (trip.result_object.latitude as NSString).doubleValue
        let longitude = (trip.result_object.longitude as NSString).doubleValue
        
      return ScrollView {
        VStack {
            MapView(name: trip.result_object.name, coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            NetworkImage(url: trip.result_object.photo.images.original.url)
            .scaledToFit()
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
            .offset(y: -130)
            .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text(trip.result_object.name)
                    .font(.title)
                Text("Location: \(trip.result_object.location_string)")
                    .font(.subheadline)
                
                if (trip.result_object.rating != nil) {
                    Text("Rating: \(trip.result_object.rating!)")
                } else {
                    Text("Rating: no data~")
                }
                Text("Time Zone: \(trip.result_object.timezone)")
                if (trip.result_object.geo_description != nil) { // 風景介紹
                    Text("Detail: \(trip.result_object.geo_description!)")
                } else if (trip.result_object.address != nil) {    // 地址
                    Text("Detail: \(trip.result_object.address!)")
                }
                
    //            Text(items.result_object.latitude)
    //            Text(items.result_object.longitude)
                }
                .padding()
                Spacer()
            
    //            Button(action: {
    //                self.player = AVPlayer(url: self.song.previewUrl)
    //                self.player?.play()
    //            }) {
    //                Image(systemName: "play.circle.fill")
    //                   .resizable()
    //                   .scaledToFit()
    //                   .frame(width: 100, height: 100)
    //            }
                .navigationBarTitle(trip.result_object.name)
            }
        }
//        .onDisappear {
//            self.player?.pause()
//        }
    }
}
