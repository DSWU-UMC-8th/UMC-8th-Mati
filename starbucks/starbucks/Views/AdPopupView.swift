//
//  AdPopupView.swift
//  starbucks
//
//  Created by 김미주 on 3/31/25.
//

import SwiftUI

struct AdPopupView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Image(.imageAd)
                .resizable()
                .aspectRatio(contentMode: .fit)
                
            Spacer()
            
            buttonGroup
            
            Spacer().frame(height: 36)
        }
        .ignoresSafeArea()
    }
    
    private var buttonGroup: some View {
        VStack(alignment: .trailing, spacing: 19) {
            Button(action: {
                print("자세히 보기")
            }, label: {
                ZStack {
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: 58)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .foregroundStyle(.green01)
                    
                    Text("자세히 보기")
                        .font(.MakeMedium18)
                        .foregroundStyle(.white)
                }
            })
            .padding(.horizontal, 19)
            
            Button(action: {
                dismiss()
            }, label: {
                Text("X 닫기")
                    .font(.MainTextLight14)
                    .foregroundStyle(.gray05)
            })
            .padding(.horizontal, 38)
        }
    }
}

struct AdPopupView_Preview: PreviewProvider {
    static var devices = ["iPhone 11", "iPhone 16 Pro"]
    
    static var previews: some View {
        ForEach(devices, id: \.self) { device in
            AdPopupView()
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}
