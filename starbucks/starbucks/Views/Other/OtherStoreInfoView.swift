//
//  OtherStoreInfoView.swift
//  starbucks
//
//  Created by 김미주 on 5/12/25.
//

import SwiftUI

struct OtherStoreInfoView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedSegment: OtherStoreSegment = .store
    @Namespace private var indicatorNamespace
    
    enum OtherStoreSegment: String, CaseIterable {
        case store = "매장 찾기"
        case direction = "길찾기"
    }
    
    var body: some View {
        VStack(spacing: 0) {
            topView
            
            OrderStoreMapView()
        }
    }
    
    private var navView: some View {
        ZStack {
            Text("매장 찾기")
                .font(.MainTextMedium16)
                .foregroundStyle(.black)
            
            HStack {
                Button(action: {
                    dismiss()
                }) {
                    Image(.iconBack)
                }
                Spacer()
            }
        }
        .padding(.horizontal, 33)
    }
    
    private var topSegmentView: some View {
        HStack {
            ForEach(OtherStoreSegment.allCases, id: \.self) { segment in
                Button {
                    withAnimation(.easeInOut) {
                        selectedSegment = segment
                    }
                } label: {
                    VStack(spacing: 3) {
                        Text(segment.rawValue)
                            .font(.MainTextSemiBold24)
                            .foregroundStyle(.black)
                        if selectedSegment == segment {
                            Capsule(style: .circular)
                                .fill(.brown02)
                                .frame(width: 120, height: 5)
                                .matchedGeometryEffect(id: "underline", in: indicatorNamespace)
                        } else {
                            Color.clear.frame(height: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.horizontal, 40)
        .padding(.vertical, 18)
    }
    
    private var topView: some View {
        VStack {
            navView
            topSegmentView
        }
        .background(.white)
        .shadow(color: .black.opacity(0.04), radius: 2, x: 0, y: 3)
    }
}

#Preview {
    OtherStoreInfoView()
}
