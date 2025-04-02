//
//  ForEachArrayView.swift
//  week3concept
//
//  Created by 김미주 on 4/2/25.
//

import SwiftUI

struct ForEachArrayView: View {
    let fruits = ["🍎 Apple", "🍌 Banana", "🍊 Orange", "🍇 Grape", "🍓 Strawberry"]
    
    var body: some View {
        List {
            ForEach(fruits, id: \.self) { fruit in
                Text(fruit)
                    .font(.title2)
            }
        }
    }
}

#Preview {
    ForEachArrayView()
}
