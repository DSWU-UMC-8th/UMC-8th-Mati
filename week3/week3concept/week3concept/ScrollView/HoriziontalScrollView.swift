//
//  HoriziontalScrollView.swift
//  week3concept
//
//  Created by 김미주 on 4/3/25.
//

import SwiftUI

struct HoriziontalScrollView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 15)  {
                ForEach(1..<10) { index in
                    Text("Item \(index)")
                        .frame(width: 100, height: 100)
                        .background(.purple.opacity(0.3))
                }
            }
        }
    }
}

#Preview {
    HoriziontalScrollView()
}
