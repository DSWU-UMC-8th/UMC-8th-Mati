//
//  ReceiptView.swift
//  starbucks
//
//  Created by 김미주 on 4/14/25.
//

import SwiftUI
import PhotosUI

struct ReceiptView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var selectedItem: [PhotosPickerItem] = []
    @State private var images: [UIImage] = []
    @State private var selectedImage: UIImage = UIImage()
    
    @State private var showActionSheet = false
    @State private var showPhotosPicker = false
    @State private var showCamera = false
    @State private var showReceiptImage = false
    
    @State private var viewModel = ReceiptViewModel()
    
    var body: some View {
        ZStack {
            Color.white01
            
            VStack {
                topGroup
                
                Spacer().frame(height: 16)
                
                HStack {
                    Text("총 ")
                        .font(.MainTextRegular18)
                        .foregroundStyle(.black)
                    +
                    Text("\(viewModel.receipts.count)건")
                        .font(.MainTextSemiBold18)
                        .foregroundStyle(.brown01)
                    
                    Spacer()
                    
                    Text("사용합계 ")
                        .font(.MainTextRegular18)
                        .foregroundStyle(.black)
                    +
                    Text("\(viewModel.receipts.map(\.total).reduce(0, +))")
                        .font(.MainTextSemiBold18)
                        .foregroundStyle(.brown01)
                }
                .padding(.horizontal, 18)
                
                Spacer().frame(height: 24)
                
                itemGroup
                
                Spacer()
            }
            .confirmationDialog("영수증을 어떻게 추가할까요?", isPresented: $showActionSheet, titleVisibility: .visible) {
                Button("앨범에서 가져오기") {
                    showPhotosPicker = true
                }
                
                Button("카메라로 촬영하기") {
                    showCamera = true
                }
                
                Button("취소", role: .cancel) {}
            }
            .photosPicker(isPresented: $showPhotosPicker, selection: $selectedItem, maxSelectionCount: 1, matching: .images)
            .onChange(of: selectedItem) { oldItems, newItems in
                for item in newItems {
                    Task {
                        if let data = try? await item.loadTransferable(type: Data.self),
                           let image = UIImage(data: data) {
                            images.append(image)
                            viewModel.startOCR(image: image)
                        }
                    }
                }
            }
            .sheet(isPresented: $showCamera) {
                CameraPicker { image in
                    images.append(image)
                    viewModel.startOCR(image: image)
                }
            }
            .fullScreenCover(isPresented: $showReceiptImage) {
                ZStack {
                    Color.black.opacity(0.8).ignoresSafeArea()
                    
                    ZStack(alignment: .topTrailing) {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .scaledToFit()
                        
                        Button(action: {
                            showReceiptImage = false
                        }) {
                            Image(.iconCancel)
                                .padding(16)
                        }
                    }
                }
            }
        }
    }
    
    private var topGroup: some View {
        HStack {
            Button(action: {
                dismiss()
            }) {
                Image(.iconBack)
            }
            
            Spacer()
            
            Text("전자영수증")
                .font(.MainTextMedium16)
                .foregroundStyle(.black)
            
            Spacer()
            
            Button(action: {
                showActionSheet = true
            }) {
                Image(.iconPlus)
            }
        }
        .frame(height: 50)
        .padding(.horizontal, 13.5)
        .background(.white)
    }
    
    private var itemGroup: some View {
        VStack(spacing: 15) {
            ForEach(viewModel.receipts, id: \.id) { receipt in
                ReceiptItemView(receipt: receipt) {
                    if let data = receipt.image {
                        print("✅ 이미지 있음: \(data.count) bytes")
                        selectedImage = UIImage(data: data) ?? UIImage()
                        showReceiptImage = true
                    }
                }
            }
        }
    }
}

// MARK: - custom view
struct ReceiptItemView: View {
    let receipt: ReceiptModel
    var onImageTap: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 9) {
            Text(receipt.store)
                .font(.MainTextSemiBold18)
                .foregroundStyle(.black)
            
            HStack {
                Text(receipt.date)
                    .font(.MainTextMedium16)
                    .foregroundStyle(.gray03)
                
                Spacer()
                
                Button(action: {
                    onImageTap()
                }) {
                    Image(.iconReceipt2)
                }
                
            }
            
            Text("\(receipt.total)원")
                .font(.MainTextSemiBold18)
                .foregroundStyle(.brown02)
            
            Spacer().frame(height: 5)
            
            Divider()
                .background(.gray01)
        }
        .padding(.horizontal, 19)
    }
}

#Preview {
    ReceiptView()
}
