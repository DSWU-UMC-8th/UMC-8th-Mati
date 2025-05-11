//
//  OrderDrinkMenu.swift
//  starbucks
//
//  Created by 김미주 on 5/6/25.
//

import SwiftUI

struct OrderDrinkMenu: View {
    let image: Image
    let titleKor: String
    let titleEng: String
    
    var body: some View {
        HStack(spacing: 16) {
            image
                .resizable()
                .frame(width: 60, height: 60)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack(alignment: .top, spacing: 1) {
                    Text(titleKor)
                        .font(.MainTextSemiBold16)
                        .foregroundStyle(.gray06)
                    Circle()
                        .foregroundStyle(.green01)
                        .frame(width: 6, height: 6)
                }
                Text(titleEng)
                    .font(.MainTextSemiBold13)
                    .foregroundStyle(.gray03)
            }
            
            Spacer()
        }
        .padding(.horizontal, 23)
    }
}

#Preview {
    OrderDrinkMenu(image: .init(.imageOrderRecommend), titleKor: "추천", titleEng: "Recommend")
}
