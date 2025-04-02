//
//  SimpleListView.swift
//  week3concept
//
//  Created by 김미주 on 4/2/25.
//

import SwiftUI

struct SimpleListView: View {
    var body: some View {
        List {
            Text("🍎 Apple")
            Text("🍌 Banana")
            Text("🍒 Cherry")
        }
    }
}

#Preview {
    SimpleListView()
}
