//
//  ForEachRangeView.swift
//  week3concept
//
//  Created by 김미주 on 4/2/25.
//

import SwiftUI

struct ForEachRangeView: View {
    var body: some View {
        VStack {
            ForEach(1..<6) { index in
                Text("항목 \(index)")
                    .font(.headline)
            }
        }
    }
}

#Preview {
    ForEachRangeView()
}
