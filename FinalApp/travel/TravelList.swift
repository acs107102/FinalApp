//
//  TravelList.swift
//  FinalApp
//
//  Created by Winnie on 2020/6/6.
//  Copyright © 2020 Winnie. All rights reserved.
//

import SwiftUI

struct TravelList: View {
    var searchName: String
    @EnvironmentObject var travelListViewModel : TravelListViewModel
    
    var body: some View {
            List(travelListViewModel.trips.indices, id: \.self
,  rowContent: { (index) in
    NavigationLink(destination: TravelDetail(index: index)) {
        TravelRow(index: index)
                }
            })
            .navigationBarTitle(searchName)
            .onAppear {
                self.travelListViewModel.fetchTravels(name: self.searchName)
            }
    }
}

struct TravelList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TravelList(searchName: "Pattaya").environmentObject(TravelListViewModel())
        }
    }
}
