//
//  TravelSearch.swift
//  FinalApp
//
//  Created by Winnie on 2020/6/6.
//  Copyright © 2020 Winnie. All rights reserved.
//

import SwiftUI

struct TravelSearch: View {
    @EnvironmentObject var travelListViewModel : TravelListViewModel
    @State private var scale: CGFloat = 1
    @State private var newScale: CGFloat = 1
    @State private var isTextField =  false
    @State private var Search = ""
    var click: Bool {
        Search.isEmpty
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Image("Trip")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(scale)
                    .gesture(MagnificationGesture()
                    .onChanged { value in
                        self.scale = self.newScale * value.magnitude
                    }
                    .onEnded { value in
                        self.newScale = self.scale
                    })
                   .onLongPressGesture {
                    self.isTextField.toggle()
                   }
                if isTextField == true {
                    HStack {
                        Spacer()
                        TextField("Search ...", text: $Search, onEditingChanged: { (editing) in
                            print("onEditingChanged", editing)
                        }) {
                            print(self.Search)
                        }
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.green, lineWidth: 3))
                            .frame(width: 300)
                        NavigationLink(destination: TravelList(searchName: self.Search)) {
                            if click == false {
                                Image(systemName:"magnifyingglass")
                                .foregroundColor(.green)
                                .font(.largeTitle)
                            }
                            Spacer()
                        }
                    }
                }
                
            }
        }
    }
}

struct TravelSearch_Previews: PreviewProvider {
    static var previews: some View {
        TravelSearch().environmentObject(TravelListViewModel())
    }
}
