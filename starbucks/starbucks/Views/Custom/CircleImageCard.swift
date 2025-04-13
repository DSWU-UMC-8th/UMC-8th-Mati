//
//  CircleImageCard.swift
//  starbucks
//
//  Created by 김미주 on 4/7/25.
//

import SwiftUI

struct CircleImageCard: View {
    let image: Image
    let title: String
    let size: Int
    let textSize: Int
    
    var body: some View {
        VStack(spacing: 10) {
            image
                .resizable()
                .frame(width: CGFloat(size), height: CGFloat(size))
            
            Text(title)
                .font(textSize == 14 ? .MainTextSemiBold14 : .MainTextSemiBold13)
                .foregroundStyle(.black03)
        }
    }
}
