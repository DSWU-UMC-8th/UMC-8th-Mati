//
//  GeometryReaderExample.swift
//  week2practice
//
//  Created by 김미주 on 3/29/25.
//

import SwiftUI

struct GeometryReaderExample: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("View Width: \(geometry.size.width)")
                Text("View Height: \(geometry.size.height)")
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(.blue.opacity(0.3))
        }
    }
}

#Preview {
    GeometryReaderExample()
}
