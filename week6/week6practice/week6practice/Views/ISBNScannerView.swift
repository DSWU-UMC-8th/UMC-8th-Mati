//
//  ISBNScannerView.swift
//  week6practice
//
//  Created by 김미주 on 5/13/25.
//

import SwiftUI

struct ISBNScannerView: View {
    @Bindable var viewModel: ISBNScannerViewModel = .init()
    
    let title: String = "바코드를 스캔해주세요"
    let subTitle: String = "ISBN 바코드 스캔을 통해\n책의 정보를 빠르고 정확하게 가져올 수 있어요!"
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            BarcodeScannerView { isbn in
                Task {
                    await viewModel.searchBook(isbn: isbn)
                }
            }
            
            backgroundView()
        }
    }
    
    @ViewBuilder
    private func backgroundView() -> some View {
        Image(.scanGuide)
            .resizable()
            .overlay(content: {
                guideLineView()
            })
            .ignoresSafeArea(.all)
    }
    
    @ViewBuilder
    private func guideLineView() -> some View {
        VStack {
            VStack(spacing: 10) {
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(subTitle)
                    .lineLimit(2)
                    .lineSpacing(2.5)
                    .multilineTextAlignment(.center)
            }
            .foregroundStyle(.white)
            
            Spacer().frame(height: 453)
            
            Button(action: {
                dismiss()
            }, label: {
                Text("나가기")
                    .font(.body)
                    .foregroundStyle(.black)
                    .padding(30)
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.white)
                    }
            })
        }
    }
}

#Preview {
    ISBNScannerView()
}
