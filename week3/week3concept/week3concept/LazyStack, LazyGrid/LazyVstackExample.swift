//
//  LazyVstackExample.swift
//  week3concept
//
//  Created by 김미주 on 4/3/25.
//

import SwiftUI

struct LazyVstackExample: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 15, content: {
                ForEach(1...50, id: \.self) { index in
                    Text("아이템: \(index)")
                        .background(.green)
                        .frame(width: 100, height: 100)
                }
            })
        }
    }
}

#Preview {
    LazyVstackExample()
}
