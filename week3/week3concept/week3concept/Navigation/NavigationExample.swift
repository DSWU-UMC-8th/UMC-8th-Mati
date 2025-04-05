//
//  NavigationExample.swift
//  week3concept
//
//  Created by 김미주 on 4/5/25.
//

import SwiftUI

struct NavigationExample: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Go to Detail", destination: DetailView())
        }
    }
}

fileprivate struct DetailView: View {
    var body: some View {
        Text("hello")
            .navigationTitle("hello Navi")
    }
}

#Preview {
    NavigationExample()
}
