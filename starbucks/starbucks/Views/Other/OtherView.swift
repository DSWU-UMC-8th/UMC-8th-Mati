//
//  OtherView.swift
//  starbucks
//
//  Created by 김미주 on 3/31/25.
//

import SwiftUI

struct OtherView: View {
    @State private var path = NavigationPath()
    @State private var viewModel = OtherViewModel()
    @AppStorage("nickname") private var nickname: String?
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = true
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.white01
                
                VStack {
                    topGroup
                    
                    Spacer().frame(height: 41)
                    
                    userGroup
                    
                    Spacer()
                    
                    payGroup
                    
                    Spacer()
                    
                    customerGroup
                    
                    Spacer()
                }
            }
            .navigationDestination(for: String.self) { value in
                switch value {
                case "Receipt":
                    ReceiptView()
                        .toolbar(.hidden)
                case "OtherStoreInfo":
                    OtherStoreInfoView()
                        .toolbar(.hidden)
                default:
                    EmptyView()
                }
            }
        }
    }
    
    private var topGroup: some View {
        VStack {
            HStack {
                Text("Other")
                    .font(.MainTextBold24)
                    .foregroundStyle(.black)
                
                Spacer()
                
                Button {
                    isLoggedIn = false
                } label: {
                    Image(.iconLogout)
                }
            }
            .padding(.horizontal, 23.5)
            .padding(.vertical, 16)
            .background(.white)
        }
    }
    
    private var userGroup: some View {
        VStack(spacing: 24) {
            VStack(spacing: 5) {
                Text(nickname?.isEmpty == false ? nickname! : "(설정 닉네임)")
                    .foregroundStyle(.green01)
                +
                Text(" 님")
                Text("환영합니다!🙌🏻")
            }
            .font(.MainTextSemiBold24)
            .foregroundStyle(.black02)
            
            HStack(spacing: 10.5) {
                ForEach(viewModel.otherUserModel, id: \.title) { item in
                    userButtonView(userIcon: item, path: $path)
                }
            }
        }
    }
    
    private var payGroup: some View {
        VStack(alignment: .leading) {
            Text("Pay")
                .font(.MainTextSemiBold18)
                .foregroundStyle(.black)
            
            Spacer().frame(height: 8)
            
            HStack {
                menuButtonView(menuIcon: viewModel.otherPayModel[0], path: $path)
                Spacer()
                menuButtonView(menuIcon: viewModel.otherPayModel[1], path: $path)
            }
            .padding(.vertical, 16)

            HStack {
                menuButtonView(menuIcon: viewModel.otherPayModel[2], path: $path)
                Spacer()
                menuButtonView(menuIcon: viewModel.otherPayModel[3], path: $path)
            }
            .padding(.vertical, 16)
            
            Divider()
                
        }
        .padding(.horizontal, 10)
    }
    
    private var customerGroup: some View {
        VStack(alignment: .leading) {
            Text("고객지원")
                .font(.MainTextSemiBold18)
                .foregroundStyle(.black)
            
            Spacer().frame(height: 8)
            
            HStack {
                menuButtonView(menuIcon: viewModel.otherCutomerModel[0], path: $path)
                Spacer()
                menuButtonView(menuIcon: viewModel.otherCutomerModel[1], path: $path)
            }
            .padding(.vertical, 16)
            
            HStack {
                menuButtonView(menuIcon: viewModel.otherCutomerModel[2], path: $path)
                Spacer()
                menuButtonView(menuIcon: viewModel.otherCutomerModel[3], path: $path)
            }
            .padding(.vertical, 16)
            
            menuButtonView(menuIcon: viewModel.otherCutomerModel[4], path: $path)
                .padding(.vertical, 16)
        }
        .padding(.horizontal, 10)
    }
    
}

// MARK: - Custom Button
struct userButtonView: View {
    @Binding var path: NavigationPath
    let userIcon: OtherModel
    
    init(userIcon: OtherModel, path: Binding<NavigationPath>) {
        self.userIcon = userIcon
        self._path = path
    }
    
    var body: some View {
        VStack {
            Button {
                print(userIcon.title)
                if userIcon.title == "전자영수증" {
                    path.append("Receipt")
                }
            } label: {
                VStack(spacing: 4) {
                    userIcon.icon
                    
                    Text(userIcon.title)
                        .font(.MainTextSemiBold16)
                        .foregroundStyle(.black03)
                        .frame(width: 102)
                }
                .padding(.vertical, 19)
                .background(.white)
                .frame(width: 102, height: 108)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(color: .black.opacity(0.1), radius: 2.5)
            }
        }
    }
}

struct menuButtonView: View {
    @Binding var path: NavigationPath
    let menuIcon: OtherModel
    
    init(menuIcon: OtherModel, path: Binding<NavigationPath>) {
        self.menuIcon = menuIcon
        self._path = path
    }
    
    var body: some View {
        Button(action: {
            print(menuIcon.title)
            if menuIcon.title == "매장 정보" {
                path.append("OtherStoreInfo")
            }
        }) {
            HStack(spacing: 4) {
                menuIcon.icon
                
                Text(menuIcon.title)
                    .font(.MainTextSemiBold16)
                    .foregroundStyle(.black02)
                
                Spacer()
            }
        }
        .frame(width: 167)
    }
}

#Preview {
    OtherView()
}
