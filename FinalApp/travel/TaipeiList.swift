//
//  TaipeiList.swift
//  FinalApp
//
//  Created by Winnie on 2020/6/21.
//  Copyright © 2020 Winnie. All rights reserved.
//

import SwiftUI

struct TaipeiList: View {
    @EnvironmentObject var taipeiListViewModel : TaipeiListViewModel
    @State private var isSearch = false
    @State private var searchText: String = ""

        
    var body: some View {
        NavigationView {
            List(taipeiListViewModel.TPEtrips.indices, id: \.self
        ,  rowContent: { (index) in
            NavigationLink(destination: TaipeiDetail(index: index)) {
                TaipeiRow(index: index)
                        }
                    })
                    .navigationBarTitle("Taipei")
                .onAppear {
                    self.taipeiListViewModel.fetchTaipei()
            }
        }
    }
}

struct TaipeiList_Previews: PreviewProvider {
    static var previews: some View {
        TaipeiList()
    }
}
