//
//  HomeView.swift
//  starbucks
//
//  Created by 김미주 on 4/6/25.
//

import SwiftUI

struct HomeView: View {
    @State private var path = NavigationPath()
    @AppStorage("nickname") private var nickname: String?
    @State private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                VStack(spacing: 20) {
                    topBannerGroup
                    
                    Image(.imageHomeBearBanner)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal, 10)
                    
                    recommendMenuGroup
                    
                    secondBannerGroup
                    
                    whatsNewBannerGroup
                    
                    thirdBannerGroup
                    
                    dessertGroup
                    
                    fourthBannerGroup
                    
                    Spacer()
                        .frame(height: 80)
                }
            }
            .ignoresSafeArea()
            .navigationDestination(for: String.self) { coffee in
                CoffeeDetailView(coffeeName: coffee)
            }
        }
    }
    
    private var topBannerGroup: some View {
        ZStack(alignment: .top) {
            Image(.imageHomeTopBanner)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack(alignment: .leading, spacing: 29) {
                Spacer()
                    .frame(height: 80)
                
                Text("골든 미모사 그린 티와 함께\n행복한 새해의 축배를 들어요!")
                    .font(.MainTextBold24)
                
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("11★ until next Reward")
                            .font(.MainTextSemiBold16)
                            .foregroundStyle(.brown02)
                            .frame(width: 200, alignment: .leading)
                        
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 4)
                                .frame(width: 210, height: 8)
                                .foregroundStyle(Color(red: 0.86, green: 0.86, blue: 0.86))
                            
                            RoundedRectangle(cornerRadius: 4)
                                .frame(width: 50, height: 8)
                                .foregroundStyle(.brown01)
                        }
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 5) {
                        Text("1")
                            .font(.MainTextSemiBold38)
                            .foregroundStyle(.black03)
                        Text("/")
                            .font(.MainTextLight24)
                            .foregroundStyle(Color(red: 0.79, green: 0.79, blue: 0.79))
                        Text("12★")
                            .font(.MainTextSemiBold24)
                            .foregroundStyle(.brown02)
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }
    
    private var recommendMenuGroup: some View {
        VStack(alignment: .leading, spacing: 25) {
            HStack {
                Text(nickname?.isEmpty == false ? nickname! : "(설정 닉네임)")
                    .font(.MainTextBold24)
                    .foregroundStyle(.brown01)
                +
                Text("님을 위한 추천 메뉴")
                    .font(.MainTextBold24)
                    .foregroundStyle(.black03)
            }
            .padding(.horizontal, 20)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 16) {
                    ForEach(viewModel.recommendMenu) { menu in
                        Button(action: {
                            print("메뉴 이름: \(menu.menuName)")
                            path.append(menu.menuName)
                        }) {
                            CircleImageCard(image: menu.menuImage, title: menu.menuName, size: 130, textSize: 14)
                        }
                    }
                }
                .padding(.horizontal, 20)
                .frame(height: 160)
            }
        }
    }
    
    private var secondBannerGroup: some View {
        VStack(spacing: 20) {
            Image(.imageHomeBloomingBanner)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Image(.imageHomeBuddypassBanner)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .padding(.horizontal, 10)
    }
    
    private var whatsNewBannerGroup: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("What's New")
                .font(.MainTextBold24)
                .foregroundStyle(.black03)
                .padding(.horizontal, 10)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 14) {
                    ForEach(viewModel.whatsNew) { new in
                        WhatsNewBannerView(banner: new.bannerImage, title: new.title, description: new.description)
                    }
                }
                .padding(.horizontal, 10)
            }
        }
    }
    
    private var thirdBannerGroup: some View {
        VStack(spacing: 14) {
            Image(.imageHomeMugBanner)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Image(.imageHomeStoreBanner)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Image(.imageHomeDeliveryBanner)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .padding(.horizontal, 10)
    }
    
    private var dessertGroup: some View {
        VStack(alignment: .leading, spacing: 25) {
            HStack {
                Text("하루가 달콤해지는 디저트")
                    .font(.MainTextSemiBold24)
                    .foregroundStyle(.black03)
            }
            .padding(.horizontal, 20)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 16) {
                    ForEach(viewModel.dessertMenu) { menu in
                        CircleImageCard(image: menu.menuImage, title: menu.menuName, size: 130, textSize: 14)
                    }
                }
                .padding(.horizontal, 20)
                .frame(height: 160)
            }
        }
    }
    
    private var fourthBannerGroup: some View {
        VStack(spacing: 20) {
            Image(.imageHomeColdbrewBanner)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Image(.imageHomeFavoritesBanner)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Image(.imageHomeSizeupBanner)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .padding(.horizontal, 10)
    }
}

#Preview {
    HomeView()
}
