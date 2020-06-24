//
//  NetworkImage.swift
//  FinalApp
//
//  Created by Winnie on 2020/6/6.
//  Copyright © 2020 Winnie. All rights reserved.
//

import SwiftUI

struct NetworkImage: View  {
    var url: URL
    @State private var image = Image(systemName: "photo")
    @State private var downloadImageOk = false

    func downLoad() {
        if let data = try? Data(contentsOf: url), let uiImage = UIImage(data: data) {
            self.image = Image(uiImage: uiImage)
            self.downloadImageOk = true
        }
    }
   var body: some View {
        image
            .resizable()
            .onAppear {
                if self.downloadImageOk == false {
                    self.downLoad()
                }
        }
    }
}

struct NetworkImage_Previews: PreviewProvider {
    static var previews: some View {
        NetworkImage(url: URL(string: "https://media-cdn.tripadvisor.com/media/photo-o/15/33/fb/5c/pattaya.jpg")!)
    }
}
