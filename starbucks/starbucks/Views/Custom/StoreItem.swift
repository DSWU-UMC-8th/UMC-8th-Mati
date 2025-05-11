//
//  StoreItem.swift
//  starbucks
//
//  Created by 김미주 on 5/6/25.
//

import SwiftUI

struct StoreItem: View {
    let store: Store
    
    var body: some View {
        HStack(spacing: 16) {
            Image(.imageAmericanoIced)
                .resizable()
                .frame(width: 83, height: 83)
                .clipShape(RoundedRectangle(cornerRadius: 6))
            
            VStack(alignment: .leading) {
                Text(store.name)
                    .font(.MainTextSemiBold13)
                    .foregroundStyle(.black03)
                
                Spacer().frame(height: 3)
                
                Text(store.address)
                    .font(.MainTextMedium10)
                    .foregroundStyle(.gray02)
                
                Spacer().frame(height: 15)
                
                HStack {
                    if store.category.contains("리저브 매장") {
                        Image(.imageR)
                        Spacer().frame(width: 4)
                    }
                    if store.category.contains("매장") {
                        Image(.imageD)
                        Spacer().frame(width: 4)
                    }
                    Spacer()
                    if let dist = store.distance {
                        Text(String(format: "%.1fkm", dist))
                            .font(.MainTextMedium12)
                            .foregroundStyle(.black01)
                    }
                }
            }
        }
        .padding(.horizontal, 32.5)
    }
}
