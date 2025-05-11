//
//  TabBar.swift
//  starbucks
//
//  Created by 김미주 on 3/31/25.
//

import SwiftUI

struct TabBar: View {
    init() {
        UITabBar.appearance().backgroundColor = .white
    }
    
    var body: some View {
        TabView {
            Tab("Home", image: "icon_home") {
                HomeView()
            }
            Tab("Pay", image: "icon_pay") {}
            Tab("Order", image: "icon_order") {
                OrderView()
            }
            Tab("Shop", image: "icon_shop") {
                ShopView()
            }
            Tab("Other", image: "icon_other") {
                OtherView()
            }
        }
        .tint(.green02)
        .background(.white)
    }
}

struct TabBar_Preview: PreviewProvider {
    static var devices = ["iPhone 11", "iPhone 16 Pro"]
    
    static var previews: some View {
        ForEach(devices, id: \.self) { device in
            TabBar()
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}
