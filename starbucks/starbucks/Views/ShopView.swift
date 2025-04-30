//
//  ShopView.swift
//  starbucks
//
//  Created by 김미주 on 4/13/25.
//

import SwiftUI

struct ShopView: View {
    @State private var viewModel = ShopViewModel()
    @State private var selection = 0
    let columns = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
        ZStack {
            Color.white01.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 44) {
                    topBanner
                    
                    allProducts
                    
                    bestItems
                    
                    newProducts
                }
                .padding(.top, 27)
            }
        }
        .onAppear() { setIndicator() }
    }
    
    private var topBanner: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Starbucks Online Store")
                .foregroundStyle(.black)
                .font(.MainTextBold24)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 28) {
                    Image(.imageShopBanner1)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 270)
                    
                    Image(.imageShopBanner2)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 270)
                    
                    Image(.imageShopBanner3)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 270)
                }
                .frame(height: 216)
            }
        }
        .padding(.horizontal, 16)
    }
    
    private var allProducts: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("All Products")
                .foregroundStyle(.black)
                .font(.MainTextSemiBold22)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 17) {
                    ForEach(viewModel.allProducts) { product in
                        CircleImageCard(image: product.image, title: product.title, size: 80, textSize: 13)
                    }
                }
            }
        }
        .padding(.horizontal, 16)
    }
    
    private var bestItems: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Best Items")
                .foregroundStyle(.black)
                .font(.MainTextSemiBold22)
            
            TabView(selection: $selection) {
                ForEach(0..<2, id: \.self) { page in
                    LazyVGrid(columns: columns, spacing: 54) {
                        ForEach(0..<4, id: \.self) { item in
                            let index = page * 4 + item
                            if index < viewModel.bestItems.count {
                                let item = viewModel.bestItems[index]
                                ShopItemCard(image: item.image, title: item.title)
                            }
                        }
                    }
                    .padding(.bottom, 50)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .frame(height: 520)
        }
        .padding(.horizontal, 16)
    }
    
    private var newProducts: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Best Items")
                .foregroundStyle(.black)
                .font(.MainTextSemiBold22)
            
            LazyVGrid(columns: columns, spacing: 30) {
                ForEach(viewModel.newProducts, id: \.id) { item in
                    ShopItemCard(image: item.image, title: item.title)
                }
            }
        }
        .padding(.horizontal, 16)
    }
    
    // MARK: - function
    private func setIndicator() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .black03
        UIPageControl.appearance().pageIndicatorTintColor = .gray02
        UIPageControl.appearance().preferredCurrentPageIndicatorImage = .iconIndicatorCurrent
        UIPageControl.appearance().preferredIndicatorImage = .iconIndicator
    }
}

#Preview {
    ShopView()
}
