//
//  TaipeiRow.swift
//  FinalApp
//
//  Created by Winnie on 2020/6/21.
//  Copyright © 2020 Winnie. All rights reserved.
//

import SwiftUI

struct TaipeiRow: View {
    @EnvironmentObject var taipeiListViewModel : TaipeiListViewModel
    var index: Int
    
    var body: some View {
        let trip = taipeiListViewModel.TPEtrips[index]
        return HStack {
            if trip.images!.isEmpty {
               Image(systemName: "photo")
                    .resizable()
                    .frame(width: 100, height: 100)
            }
            else {
                NetworkImage(url: trip.images![0].src)
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipped()
            }
            VStack(alignment: .leading) {
                Text(trip.name)
                    .bold()
                //Text()
            }
        }
    }

}

struct TaipeiRow_Previews: PreviewProvider {
    static var previews: some View {
        TaipeiRow(index: 0).environmentObject(TaipeiListViewModel())
    }
}
