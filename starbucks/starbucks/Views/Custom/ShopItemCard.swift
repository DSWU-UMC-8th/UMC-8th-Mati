//
//  ShopItemCard.swift
//  starbucks
//
//  Created by 김미주 on 4/13/25.
//

import Foundation
import SwiftUI

struct ShopItemCard: View {
    let image: Image
    let title: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            image
                .resizable()
                .frame(width: 157, height: 156)
            
            Text(title)
                .font(.MainTextSemiBold14)
                .foregroundStyle(.black02)
                .lineLimit(2)
        }
    }
}
