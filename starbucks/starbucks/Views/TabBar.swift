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
            Tab("Home", image: "icon_home") {}
            Tab("Pay", image: "icon_pay") {}
            Tab("Order", image: "icon_order") {}
            Tab("Shop", image: "icon_shop") {}
            Tab("Other", image: "icon_other") {
                OtherView()
            }
        }
        .tint(.green02)
        .background(.white)
    }
}

#Preview {
    TabBar()
}
