//
//  ScrollView.swift
//  week3concept
//
//  Created by 김미주 on 4/3/25.
//

import SwiftUI

struct SimpleScrollView: View {
    let rows = Array(repeating: GridItem(.fixed(80)), count: 2)
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<50) { index in
                    Text("Item \(index)")
                        .frame(maxWidth: .infinity)
                        .background(.blue.opacity(0.3))
                }
            }
        }
        .scrollIndicators(.visible, axes: .vertical)
        .contentMargins(.horizontal, 0, for: .scrollIndicators)
    }
}

#Preview {
    SimpleScrollView()
}
