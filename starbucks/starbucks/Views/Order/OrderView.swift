//
//  OrderView.swift
//  starbucks
//
//  Created by 김미주 on 5/6/25.
//

import SwiftUI

struct OrderView: View {
    @State private var viewModel = OrderViewModel()
    
    @State private var selectedTopSegment: OrderTopSegment = .allMenu
    @State private var selectedBottomSegment: OrderBottomSegment = .drink
    @State var showSheet: Bool = false
    
    @Namespace private var indicatorNamespace
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            topMenuGroup
            
            drinksGroup
            
            bottomSheetButton
        }
    }
    
    private var topMenuGroup: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Order")
                .font(.MainTextBold24)
                .foregroundStyle(.black03)
                .padding(.horizontal, 23)
                .frame(height: 36)
            
            topSegmentBar
                .frame(height: 53)
            
            bottomSegmentBar
        }
    }
    
    private var topSegmentBar: some View {
        HStack {
            ForEach(OrderTopSegment.allCases, id: \.self) { segment in
                VStack(spacing: 13) {
                    Button(action: {
                        withAnimation(.easeInOut) {
                            selectedTopSegment = segment
                        }
                    }) {
                        HStack(spacing: 4) {
                            if segment == .cakeReservation {
                                Image(.iconCake)
                            }
                            Text(segment.rawValue)
                                .font(.MainTextBold16)
                        }
                        .foregroundStyle(segment == .cakeReservation ? .green01 : selectedTopSegment == segment ? .black01 : .gray04)
                        .frame(maxWidth: .infinity)
                    }

                    ZStack {
                        if selectedTopSegment == segment {
                            Rectangle()
                                .fill(Color.green01)
                                .frame(height: 3)
                                .matchedGeometryEffect(id: "segment", in: indicatorNamespace)
                                .shadow(color: .black.opacity(0.15), radius: 1.5, x: 0, y: 3)
                        } else {
                            Color.clear.frame(height: 3)
                        }
                    }
                }
                .frame(width: segment.fixedWidth)
            }
        }
        .background(Color.white.shadow(color: .black.opacity(0.15), radius: 1.5, y: 3))
    }
    
    private var bottomSegmentBar: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 12) {
                ForEach(OrderBottomSegment.allCases, id: \.self) { segment in
                    Button(action: {
                        selectedBottomSegment = segment
                    }) {
                        HStack(spacing: 1) {
                            Text(segment.rawValue)
                                .font(.MainTextSemiBold16)
                                .foregroundStyle(selectedBottomSegment == segment ? .black01 : .gray04)
                            Image(.imageNew)
                        }
                    }
                }
            }
            .padding(.horizontal, 23)
            .padding(.bottom, 12)
            Divider()
        }
    }

    private var drinksGroup: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 26) {
                ForEach(viewModel.orderDrinkMenu) { drink in
                    OrderDrinkMenu(image: drink.image, titleKor: drink.titleKor, titleEng: drink.titleEng)
                }
            }
            .padding(.vertical, 19)
        }
    }
    
    private var bottomSheetButton: some View {
        Button(action: {
            showSheet.toggle()
        }) {
            VStack(spacing: 7) {
                HStack {
                    Text("주문할 매장을 선택해 주세요")
                        .font(.MainTextSemiBold16)
                        .foregroundStyle(.white)
                    Spacer()
                    Image(.iconBottomArrow)
                }
                Divider()
                    .background(.gray06)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(.black02)
        }
        .sheet(isPresented: $showSheet) {
            OrderSheet(searchText: .constant(""))
        }
    }
}

#Preview {
    OrderView()
}
