//
//  DynamicLayoutView.swift
//  week2practice
//
//  Created by 김미주 on 3/29/25.
//

import SwiftUI

struct DynamicLayoutView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("전체 화면의 50% 크기 박스")
                    .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.5)
                    .background(.green.opacity(0.5))
                    .border(.green)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .border(.red)
        }
    }
}

#Preview {
    DynamicLayoutView()
}
