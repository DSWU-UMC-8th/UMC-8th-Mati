//
//  ListNavigationLink.swift
//  week3concept
//
//  Created by 김미주 on 4/6/25.
//

import SwiftUI

struct ListNavigationLink: View {
    let items = ["Apple", "Banana", "Cherry", "Mango"]
    
    var body: some View {
        NavigationStack {
            List(items, id: \.self) { item in
                NavigationLink(destination: ListDetailView(item: item)) {
                    Text(item)
                }
            }
            .navigationTitle("Fruits")
        }
    }
}

struct ListDetailView: View {
    let item: String
    
    var body: some View {
        Text("Selected: \(item)")
            .font(.largeTitle)
            .navigationTitle(item)
    }
}

#Preview {
    ListNavigationLink()
}
