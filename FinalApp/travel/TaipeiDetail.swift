//
//  TaipeiDetail.swift
//  FinalApp
//
//  Created by Winnie on 2020/6/21.
//  Copyright © 2020 Winnie. All rights reserved.
//

import SwiftUI
import CoreLocation

struct TaipeiDetail: View {
    @EnvironmentObject var taipeiListViewModel : TaipeiListViewModel
    @State private var showWebpage = false
    var index: Int
        
    var body: some View {
        let trip = taipeiListViewModel.TPEtrips[index]
        
        return ScrollView {
        VStack {
            MapView(name: trip.name, coordinate: CLLocationCoordinate2D(latitude: trip.nlat, longitude: trip.elong))
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
                
            if trip.images!.isEmpty {

            }
            else {
                NetworkImage(url: trip.images![0].src)
                    .scaledToFit()
                    .frame(width: 300)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                    .offset(y: -130)
                    .padding(.bottom, -130)
            }
                
            VStack(alignment: .leading) {
                Text(trip.name)
                    .font(.title)
                Text(trip.distric)
                    .font(.subheadline)
                Text("\n電話：\(trip.tel)")
                Text("地址：\(trip.address)\n")
                Text("介紹：")
                    .fontWeight(.bold)
                Text("\(trip.introduction)\n")
                if trip.official_site != nil {
                    Text("官網：")
                        .fontWeight(.bold)
                    Button("相關連結") {
                        self.showWebpage = true
                    }
                    .sheet(isPresented: $showWebpage) {
                        SafariView(url: URL(string: "\(trip.official_site!)")!)
                    }
                }
                if trip.ticket != nil {
                    Text("門票：")
                        .fontWeight(.bold)
                    Text("\(trip.ticket!)\n")
                }
                if trip.open_time != nil {
                    Text("開放時間：")
                        .fontWeight(.bold)
                    Text("\(trip.open_time!)\n")
                }
                if trip.remind != nil {
                    Text("小叮嚀：")
                        .fontWeight(.bold)
                    Text("\(trip.remind!)\n")
                }
            }
                    
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    if trip.images!.isEmpty {}
                    else {
                        ForEach(trip.images!.indices, id: \.self) { (index) in
                            NetworkImage(url: trip.images![index].src)
                                .scaledToFit()
                                .frame(height: 200)
                            }
                        }
                    }
                }
                .padding()
                Spacer()
                
                .navigationBarTitle(trip.name)
                }
            }
        }
}

//struct TaipeiDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        TaipeiDetail()
//    }
//}
