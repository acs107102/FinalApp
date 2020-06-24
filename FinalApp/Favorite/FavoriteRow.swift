//
//  FavoriteRow.swift
//  FinalApp
//
//  Created by Winnie on 2020/6/10.
//  Copyright © 2020 Winnie. All rights reserved.
//

import SwiftUI

struct FavoriteRow: View {
    var favor: Favorite
//    var photo: Picture
    var body: some View {
        HStack {
//            Image(uiImage: UIImage(contentsOfFile:photo.imagePath)!)
//            .resizable()
//            .scaledToFill()
//            .frame(width:80,height:80)
//            .clipped()
            
            Text("\(favor.name)")
            Text("\(favor.place)")
            //Text("\(favor.date)")
        }
    }
}

//struct FavoriteRow_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoriteRow(favor: Favorite(name: "Winnie", place: "England", date: "2020-09-23", dayTravel: 5, airport: "TPE", airline: "Singapore Airlines (新加坡航空)", airclass: "Economic"))
//    }
//}
