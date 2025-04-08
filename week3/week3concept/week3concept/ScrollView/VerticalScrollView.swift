//
//  VerticalScrollView.swift
//  week3concept
//
//  Created by 김미주 on 4/3/25.
//

import SwiftUI

struct VerticalScrollView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 10) {
                ForEach(1..<30) { index in
                    Text("Row \(index)")
                        .frame(maxWidth: .infinity)
                        .background(.green.opacity(0.3))
                }
            }
        }
    }
}

#Preview {
    VerticalScrollView()
}
