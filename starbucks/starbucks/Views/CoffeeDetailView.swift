//
//  CoffeeDetailView.swift
//  starbucks
//
//  Created by 김미주 on 4/8/25.
//

import SwiftUI

struct CoffeeDetailView: View {
    @State private var viewModel = CoffeeDetailViewModel()
    @State private var selectedTemp: String = "HOT"
    @Environment(\.dismiss) var dismiss
    var coffeeName: String
    
    private var coffee: CoffeeDetailModel? {
        viewModel.coffeeDetails.first { $0.nameKor == coffeeName }
    }
    
    var body: some View {
        if let coffee = coffee {
            VStack(alignment: .leading, spacing: 20) {
                topMenuGroup(coffee: coffee)
                
                VStack(alignment: .leading, spacing: 30) {
                    nameGroup(coffee: coffee)
                    
                    infoGroup(coffee: coffee)
                }
                .padding(.horizontal, 10)
                
                if coffee.only == false {
                    HotIcedButton(temp: $selectedTemp)
                } else {
                    OnlyHotIcedButton(temp: coffee.temp)
                }
                
                Spacer()
                
                bottomGroup
            }
            .onAppear {
                selectedTemp = coffee.temp
            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden()
            .toolbar(.hidden, for: .tabBar)
        }
    }
    
    private func topMenuGroup(coffee: CoffeeDetailModel) -> some View {
        ZStack(alignment: .top) {
            coffee.image
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack {
                Spacer().frame(height: 50)
                
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(.iconBackGray)
                    }
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image(.iconShareGray)
                    }
                }
            }
            .padding(.horizontal, 8)
        }
    }
    
    private func nameGroup(coffee: CoffeeDetailModel) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 4) {
                Text(coffee.nameKor)
                    .font(.MainTextSemiBold24)
                    .foregroundStyle(.black03)
                
                Image(.imageNew)
            }
            
            Text(coffee.nameEng)
                .font(.MainTextSemiBold14)
                .foregroundStyle(.gray01)
        }
    }
    
    private func infoGroup(coffee: CoffeeDetailModel) -> some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(coffee.description.split(separator: "").joined(separator: "\u{200B}"))
                .font(.MainTextSemiBold14)
                .foregroundStyle(.gray06)
            
            Text(coffee.price)
                .font(.MainTextBold24)
                .foregroundStyle(.black03)
        }
    }
    
    private var bottomGroup: some View {
        ZStack {
            Rectangle()
                .frame(height: 72)
                .foregroundStyle(.white)
                .shadow(color: .black.opacity(0.04), radius: 3.5, x: 0, y: -3)
            
            Button(action: {
                print("주문하기")
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 21)
                    
                    Text("주문하기")
                        .font(.MainTextMedium16)
                        .foregroundStyle(.white)
                }
                .frame(height: 42)
                .foregroundStyle(.green00)
                .padding(.horizontal, 28)
            }
        }
    }
}

#Preview {
    CoffeeDetailView(coffeeName: "아이스 카라멜 마끼아또")
}
