//
//  SplashView.swift
//  starbucks
//
//  Created by 김미주 on 3/23/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack (alignment: .center) {
            Color(.green01)
                .ignoresSafeArea()
            Image(.logoStarbucks)
                .resizable()
                .frame(width: 168, height: 168)
        }
    }
}

struct SplashView_Preview: PreviewProvider {
    static var devices = ["iPhone 11", "iPhone 16 Pro"]
    
    static var previews: some View {
        ForEach(devices, id: \.self) { device in
            SplashView()
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}
