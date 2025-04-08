//
//  LazyHGridView.swift
//  week3concept
//
//  Created by 김미주 on 4/5/25.
//

import SwiftUI

struct LazyHGridView: View {
    let rows = Array(repeating: GridItem(.fixed(80)), count: 2)
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, spacing: 10) {
                ForEach(1...15, id: \.self) { index in
                    Text("Item \(index)")
                        .frame(width: 80)
                        .frame(maxHeight: .infinity)
                        .background(.green.opacity(0.7))
                }
            }
        }
    }
}

#Preview {
    LazyHGridView()
}
