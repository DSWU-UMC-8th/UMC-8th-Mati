//
//  ResponsiveButtonView.swift
//  week2practice
//
//  Created by 김미주 on 3/29/25.
//

import SwiftUI

struct ResponsiveButtonView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("반응형 버튼")
                    .frame(width: geometry.size.width * 0.6, height: geometry.size.height * 0.1)
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

struct ResponsiveButtonVew_Previews: PreviewProvider {
    static let devices = ["iPhone 11", "iPhone 16 Pro"]
    
    static var previews: some View {
        ForEach(devices, id: \.self) { device in
            ResponsiveButtonView()
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}
