//
//  LazyVGridView.swift
//  week3concept
//
//  Created by 김미주 on 4/5/25.
//

import SwiftUI

struct LazyVGridView: View {
    let columns = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(1...20, id: \.self) { index in
                    Text("Item \(index)")
                        .frame(height: 80)
                        .frame(maxWidth: .infinity)
                        .background(.blue.opacity(0.7))
                }
            }
        }
    }
}

#Preview {
    LazyVGridView()
}
