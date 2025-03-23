//
//  SwiftUIView2.swift
//  week1practice
//
//  Created by 김미주 on 3/19/25.
//

import SwiftUI

struct StackView: View {
    var body: some View {
        VStack {
            vStackView
            Spacer().frame(height: 50)
            hStackView
            Spacer().frame(height: 100)
            zStackView
        }

    }
    
    private var vStackView: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("first")
                .font(.title)
            Text("second")
                .font(.headline)
            Text("third")
                .font(.subheadline)
        }
    }
    
    private var hStackView: some View {
        HStack(alignment: .center, spacing: 20) {
            Image(systemName: "star.fill")
            Text("즐겨찾기")
                .font(.headline)
        }
    }
    
    private var zStackView: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 300)
            Text("중앙 텍스트")
                .font(.title)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    StackView()
}
