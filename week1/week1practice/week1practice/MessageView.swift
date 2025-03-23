//
//  MessageView.swift
//  week1practice
//
//  Created by 김미주 on 3/19/25.
//

import SwiftUI

struct MessageView: View {
    
    let message: String
    
    init(message: String) {
        self.message = message
    }
    
    var body: some View {
        Text(message)
            .font(.title)
            .foregroundStyle(.green)
    }
}

#Preview {
    MessageView(message: "Test")
}
