//
//  FavoriteView.swift
//  FinalApp
//
//  Created by Winnie on 2020/6/10.
//  Copyright © 2020 Winnie. All rights reserved.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var favoriteViewModel: FavoriteViewModel
    @State private var show = false
//    @State private var isSearch = false
//    @State private var searchText: String = ""
    var body: some View {
        NavigationView {
//            SearchBar(text: $searchText, placeholder: "Search Airline")
//                .onTapGesture {
//                    self.isSearch.toggle()
//                }
//
//                if isSearch == true {
//                    List {
//                        ForEach(favor.name.filter {
//                            self.searchText.isEmpty ? true :$0.lowercased().contains(self.searchText.lowercased())
//                        }, id: \.self) { airplane in
//                            Text(airplane)
//                        }
//                    }
//                }
            List {
                ForEach(favoriteViewModel.favorite){ (favors) in
                    NavigationLink(destination: FavoriteInsert(editFavorite: favors)) {
                        FavoriteRow(favor: favors)
                    }
                }
                .onMove { (indexSet, index) in
                    self.favoriteViewModel.favorite.move(fromOffsets: indexSet,
                                    toOffset: index)
                }
                .onDelete{ (index) in
                    self.favoriteViewModel.favorite.remove(atOffsets: index)
                }
            }
            .navigationBarTitle("List")
            .navigationBarItems(leading: EditButton().accentColor(.green), trailing: Button(action: {
                    self.show = true
                },label: {
                    Image(systemName: "calendar.badge.plus")
                        .accentColor(.purple)
                    }))
                .sheet(isPresented: $show){
                    NavigationView {
                        FavoriteInsert().environmentObject(self.favoriteViewModel) // 新增時不用修改
                    }
            }
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView().environmentObject(FavoriteViewModel())
    }
}
