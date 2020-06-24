//
//  FavoriteInsert.swift
//  FinalApp
//
//  Created by Winnie on 2020/6/10.
//  Copyright © 2020 Winnie. All rights reserved.
//

import SwiftUI

struct FavoriteInsert: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var favoriteViewModel: FavoriteViewModel
//    @EnvironmentObject var photoViewModel: PhotoViewModel
    
//    var editPhoto: Picture?
    var editFavorite: Favorite?
    
    @State private var showSelectPhoto = false
    @State private var selectImage = Image(systemName: "photo")
//    @State private var content = ""
    
//    @State private var searchText: String = ""
//    @State private var isSearch = false
    @State private var name = ""
    @State private var place = ""
    @State private var dayTravel = 2
    @State private var airport = "" // try api
    @State private var airline = "" // try UISearchBar
    @State private var airclass = ""
    @State private var date = Date()
       let dateFormatter: DateFormatter = {
       let dateFormatter = DateFormatter()
       dateFormatter.dateStyle = .short
       return dateFormatter
    }()
   
    
    var disableForm: Bool {
        name.isEmpty || place.isEmpty || airclass.isEmpty
    }
    var airplanes = ["Air New Zealand (紐西蘭航空)", "Singapore Airlines (新加坡航空)", "ANA All Nippon Airways (全日空航空)", "Qantas (澳洲航空)", "Cathay Pacific (國泰航空)", "Emirates (阿聯酋航空)", "Virgin Atlantic (維珍航空)", "EVA Air (長榮航空)", "Qatar Airways (卡達航空)", "Virgin Australia (維珍澳洲航空)"]
    var Class = ["First Class", "Bussiness Class", "Economy Class"]
    
    
    var body: some View {
        VStack {
            VStack {
                Button(action: {
                    self.showSelectPhoto = true
                 }) {
                    selectImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                }
                .buttonStyle(PlainButtonStyle())
                .sheet(isPresented: $showSelectPhoto) {
                    ImagePickerController(showSelectPhoto: self.$showSelectPhoto, selectImage: self.$selectImage)
                }
                
//                Button(action:{self.showingImagePicker = true}){
//                    Group {
//                         if self.selectImage != nil {
//                             Image(uiImage: self.selectImage!)
//                                .resizable()
//                                .renderingMode(.original)
//                        } else {
//                            Image(systemName: "photo")
//                                .resizable()
//                        }
//                    }.scaledToFill()
//                    .frame(width: 200, height: 200)
//                    .clipShape(Circle())
//                }.foregroundColor(Color.black)
//                .sheet(isPresented: $showingImagePicker) {
//                    ImagePickerController(showSelectPhoto: self.$showingImagePicker, selectImage: self.$selectImage)}
            }

            Form {
                TextField("Name", text: $name)
                TextField("Country", text: $place)
                DatePicker("Time", selection: self.$date, in: Date()..., displayedComponents: .date)
                    //Text(dateFormatter.string(from: date))
                Stepper("Day: \(dayTravel)", value: $dayTravel, in: 2...60)
                // 還有airport，考慮使用api
                VStack {
                    Picker(selection: self.$airline, label: Text("airplane")) {
                        ForEach(self.airplanes, id:\.self) { (airplane) in
                            Text(airplane)
                        }
                    }
                }
    //            SearchBar(text: $searchText, placeholder: "Search Airline")
    //                .onTapGesture {
    //                self.isSearch.toggle()
    //            }
    //
    //            if isSearch == true {
    //                List {
    //                    ForEach(self.airplanes.filter {
    //                        self.searchText.isEmpty ? true : $0.lowercased().contains(self.searchText.lowercased())
    //                    }, id: \.self) { airplane in
    //                        Text(airplane)
    //                            .onTapGesture {
    //                                print("tap", airplane)
    //                        }
    //                    }
    //                }
    //            }
                
                VStack(alignment: .leading) {
                    Text("Class")
                    Picker(selection: self.$airclass, label: Text("Class")) {
                        ForEach(self.Class, id:\.self) { (city) in
                            Text(city)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
            }.navigationBarTitle(editFavorite == nil ? "Add new" : "Edit")
            .navigationBarItems(trailing: Button("save"){
//                let imageName = UUID().uuidString
//                let url = PhotoViewModel.documentsDirectory.appendingPathComponent(imageName)
//                try? self.selectImage?.jpegData(compressionQuality: 0.9)?.write(to: url)
//                let photo = Picture(content: self.content, imageName: imageName)
                let favor = Favorite(name: self.name, place: self.place, date: self.date, dayTravel: self.dayTravel, airport: self.airport, airline: self.airline, airclass: self.airclass)
                     if let editFavorite = self.editFavorite{
                         let index = self.favoriteViewModel.favorite.firstIndex{
                             $0.id == editFavorite.id
                         }!      // 因為必有值，所以用驚嘆號
                         self.favoriteViewModel.favorite[index] = favor
                     } else{
                         self.favoriteViewModel.favorite.insert(favor, at: 0)
                     }
//                    if let editPhoto = self.editPhoto{
//                        let index = self.photoViewModel.photos.firstIndex{
//                            $0.id == editPhoto.id
//                        }!      // 因為必有值，所以用驚嘆號
//                        self.photoViewModel.photos[index] = photo
//                    } else{
//                        self.photoViewModel.photos.insert(photo, at: 0)
//                    }
                     self.presentationMode.wrappedValue.dismiss()
                 }.disabled(disableForm))
            
                     .onAppear{
                         if let editFavorite = self.editFavorite, self.place == "" {
                            self.name = editFavorite.name
                            self.place = editFavorite.place
                            self.date = editFavorite.date
                            self.dayTravel = editFavorite.dayTravel
                            self.airport = editFavorite.airport
                            self.airline = editFavorite.airline
                            self.airclass = editFavorite.airclass
                         }
//                        if let editPhoto = self.editPhoto {
//                            self.content = editPhoto.content
//                            self.imageName = editPhoto.imageName
//                        }
            }
        }
    }
}

struct FavoriteInsert_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FavoriteInsert().environmentObject(FavoriteViewModel())
        }
    }
}
