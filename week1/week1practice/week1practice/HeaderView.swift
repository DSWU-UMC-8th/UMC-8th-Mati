//
//  HeaderView.swift
//  week1practice
//
//  Created by 김미주 on 3/19/25.
//

import SwiftUI

struct HeaderView: View {
    let text: String
    
    init(text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .foregroundStyle(.red)
            .font(.largeTitle)
    }
}

#Preview {
    HeaderView(text: "Test")
}
