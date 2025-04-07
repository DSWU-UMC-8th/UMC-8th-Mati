//
//  WhatsNewBannerView.swift
//  starbucks
//
//  Created by 김미주 on 4/8/25.
//

import SwiftUI

struct WhatsNewBannerView: View {
    let banner: Image
    let title: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            banner
                .resizable()
                .frame(width: 242, height: 160)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            
            Spacer().frame(height: 16)
            
            Text(title)
                .font(.MainTextSemiBold18)
                .foregroundStyle(.black02)
            
            Spacer().frame(height: 9)
            
            Text(description.split(separator: "").joined(separator: "\u{200B}"))
                .font(.MainTextSemiBold13)
                .foregroundStyle(.gray03)
                .lineLimit(2)
        }
        .frame(width: 242)
    }
}
