//
//  LoginView.swift
//  starbucks
//
//  Created by 김미주 on 3/22/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel = .init()
    @FocusState private var focusedField: Field?
    @State private var path = NavigationPath()
    
    enum Field {
        case id
        case password
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer().frame(height: 104)
                introGroup
                Spacer()
                loginGroup
                Spacer()
                ButtonGroup
                Spacer().frame(height: 20)
            }
            .padding(.horizontal, 20)
        }
    }
    
    private var introGroup: some View {
        VStack {
            Image(.logoStarbucks)
                .resizable()
                .frame(width: 97, height: 95)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer().frame(height: 28)
            
            Text("안녕하세요.\n스타벅스입니다.")
                .foregroundStyle(.black)
                .font(.MainTextExtraBold24)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer().frame(height: 19)
            
            Text("회원 서비스 이용을 위해 로그인 해주세요")
                .font(.MainTextMedium16)
                .foregroundStyle(Color(red: 0.75, green: 0.74, blue: 0.74))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    private var loginGroup: some View {
        VStack (spacing: 47) {
            VStack {
                TextField("아이디", text: $viewModel.id)
                    .font(.MainTextRegular13)
                    .foregroundStyle(.black01)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .textInputAutocapitalization(.never) // 첫글자 대문자 방지
                    .focused($focusedField, equals: .id)
                Divider()
                    .background(focusedField == .id ? .green01 : .gray00)
            }

            VStack {
                SecureField("비밀번호", text: $viewModel.password)
                    .font(.MainTextRegular13)
                    .foregroundStyle(.black01)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .textInputAutocapitalization(.never) // 첫글자 대문자 방지
                    .focused($focusedField, equals: .password)
                Divider()
                    .background(focusedField == .password ? .green01 : .gray00)
            }
            
            Button(action: {
                print("Login Button Tapped")
            }, label: {
                ZStack {
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: 46)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .foregroundStyle(.green01)
                    
                    Text("로그인하기")
                        .font(.MainTextMedium16)
                        .foregroundStyle(.white)
                }
            })
        }
    }
    
    private var ButtonGroup: some View {
        VStack (spacing: 19) {
            NavigationLink(destination: SignupView()) {
                Text("이메일로 회원가입하기")
                    .font(.MainTextRegular12)
                    .foregroundStyle(Color(red: 0.47, green: 0.47, blue: 0.47))
                    .underline()
            }
            Image(.loginKakao)
            Image(.loginApple)
        }
    }
}

struct LoginView_Preview: PreviewProvider {
    static var devices = ["iPhone 11", "iPhone 16 Pro"]
    
    static var previews: some View {
        ForEach(devices, id: \.self) { device in
            LoginView()
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}
