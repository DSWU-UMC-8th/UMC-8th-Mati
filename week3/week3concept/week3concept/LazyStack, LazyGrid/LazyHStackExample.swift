//
//  LazyHStackExample.swift
//  week3concept
//
//  Created by 김미주 on 4/3/25.
//

import SwiftUI

struct LazyHStackExample: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 15, content: {
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
    LazyHStackExample()
}
