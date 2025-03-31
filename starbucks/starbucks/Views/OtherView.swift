//
//  OtherView.swift
//  starbucks
//
//  Created by 김미주 on 3/31/25.
//

import SwiftUI

struct OtherView: View {
    @State private var viewModel = OtherViewModel()
    @AppStorage("apNickname") private var nickname: String = "(작성한 닉네임)"
    
    var body: some View {
        VStack {
            topGroup
            
            Spacer().frame(height: 41)
            
            userGroup
            
            Spacer()
            
            payGroup
            
            Spacer()
            
            customerGroup
            
            Spacer().frame(height: 41)
        }
        .background(.white01)
        .ignoresSafeArea()
    }
    
    private var topGroup: some View {
        VStack {
            Spacer()
            
            HStack {
                Text("Other")
                    .font(.MainTextBold24)
                    .foregroundStyle(.black)
                
                Spacer()
                
                Button {
                    print("logout")
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
                Text(nickname)
                    .foregroundStyle(.green01)
                +
                Text(" 님")
                Text("환영합니다!🙌🏻")
            }
            .font(.MainTextSemiBold24)
            .foregroundStyle(.black02)
            
            HStack(spacing: 10.5) {
                ForEach(viewModel.otherUserModel, id: \.title) { item in
                    userButtonView(userIcon: item)
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
                menuButtonView(menuIcon: viewModel.otherPayModel[0])
                Spacer()
                menuButtonView(menuIcon: viewModel.otherPayModel[1])
            }
            .padding(.vertical, 16)

            HStack {
                menuButtonView(menuIcon: viewModel.otherPayModel[2])
                Spacer()
                menuButtonView(menuIcon: viewModel.otherPayModel[3])
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
                menuButtonView(menuIcon: viewModel.otherCutomerModel[0])
                Spacer()
                menuButtonView(menuIcon: viewModel.otherCutomerModel[1])
            }
            .padding(.vertical, 16)
            
            HStack {
                menuButtonView(menuIcon: viewModel.otherCutomerModel[2])
                Spacer()
                menuButtonView(menuIcon: viewModel.otherCutomerModel[3])
            }
            .padding(.vertical, 16)
            
            menuButtonView(menuIcon: viewModel.otherCutomerModel[4])
                .padding(.vertical, 16)
        }
        .padding(.horizontal, 10)
    }
    
}

struct userButtonView: View {
    let userIcon: OtherModel
    
    init(userIcon: OtherModel) {
        self.userIcon = userIcon
    }
    
    var body: some View {
        Button {
            print(userIcon.title)
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

struct menuButtonView: View {
    let menuIcon: OtherModel
    
    init(menuIcon: OtherModel) {
        self.menuIcon = menuIcon
    }
    
    var body: some View {
        Button(action: {
            print(menuIcon.title)
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
