//
//  FrameView.swift
//  week1practice
//
//  Created by 김미주 on 3/19/25.
//

import SwiftUI

struct FrameView: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .frame(width: 200, height: 100)
                .background(.blue)
            
            Text("Resizable Text")
                .frame(minWidth: 100, idealWidth: 200, maxWidth: 300, minHeight: 50, maxHeight: 150)
                .background(.green)
            
            Text("Full Width")
                .frame(maxWidth: .infinity)
                .background(.orange)
            
            Rectangle()
                .fill(.blue)
                .frame(maxHeight: .infinity)
        }
    }
}

#Preview {
    FrameView()
}
