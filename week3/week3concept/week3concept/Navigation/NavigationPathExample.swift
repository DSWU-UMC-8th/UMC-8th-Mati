//
//  NavigationPathExample.swift
//  week3concept
//
//  Created by 김미주 on 4/6/25.
//

import SwiftUI

struct NavigationPathExample: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Button("Go to Detail") {
                    path.append("Detail")
                }
            }
            .navigationDestination(for: String.self) { value in
                PathDetailView(title: value)
            }
            .navigationTitle("Home")
        }
    }
}

struct PathDetailView: View {
    @Environment(\.dismiss) var dismiss
    let title: String
    
    var body: some View {
        VStack {
            Text("This is \(title) View")
                .navigationTitle(title)
            
            Button("Go Back") {
                dismiss()
            }
        }
    }
}

#Preview {
    NavigationPathExample()
}
