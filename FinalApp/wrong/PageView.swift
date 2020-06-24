//
//  PageView.swift
//  FinalApp
//
//  Created by Winnie on 2020/6/22.
//  Copyright © 2020 Winnie. All rights reserved.
//


import SwiftUI

struct PageView<Page: View>: View {
    var viewControllers: [UIHostingController<Page>]
    @State var currentPage = 0

    init(_ views: [Page]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
    }

    var body: some View {
        PageViewController(controllers: viewControllers, currentPage: $currentPage)
    }
}

//struct PageView_Previews: PreviewProvider {
//    static var previews: some View {
//        PageView(features.map { FeatureCard(landmark: $0) })
//        .aspectRatio(3/2, contentMode: .fit)
//    }
//}
