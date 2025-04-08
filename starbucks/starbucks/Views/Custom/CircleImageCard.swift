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
    
    var body: some View {
        VStack(spacing: 10) {
            image
                .resizable()
                .frame(width: 130, height: 130)
            
            Text(title)
                .font(.MainTextSemiBold14)
                .foregroundStyle(.black03)
        }
    }
}
