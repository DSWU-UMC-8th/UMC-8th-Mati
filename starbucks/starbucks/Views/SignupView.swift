//
//  SignupView.swift
//  starbucks
//
//  Created by 김미주 on 3/29/25.
//

import SwiftUI

struct SignupView: View {
    @State var viewModel: SignupViewModel = .init()
    @FocusState private var focusedField: Field?
    @Environment(\.dismiss) var dismiss
    
    enum Field {
        case nickname
        case email
        case password
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                    .frame(height: 210)
                
                textFieldGroup
                
                Spacer()
                
                createButton
                
                Spacer()
                    .frame(height: 72)
            }
            .modifier(
                CustomNavigationBar(
                    leftView: {
                        Button(action: {
                            dismiss()
                        }, label: {
                            Image(.iconBack)
                        })
                    },
                    centerView: {
                        Text("가입하기")
                            .font(.MainTextMedium16)
                            .foregroundStyle(.black)
                    },
                    rightView: {
                        Spacer()
                    }
                )
            )
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private var textFieldGroup : some View {
        VStack(spacing: 49) {
            makeTextField(focus: .nickname, string: "닉네임", text: $viewModel.user.nickname)
            
            makeTextField(focus: .email, string: "이메일", text: $viewModel.user.email)
            
            makeTextField(focus: .password, string: "비밀번호", text: $viewModel.user.password)
        }
        .padding(.horizontal, 19)
    }
    
    private func makeTextField(focus: Field, string: String, text: Binding<String>) -> some View {
        VStack(spacing: 9) {
            if focus == .password {
                SecureField(string, text: text)
                    .font(.MainTextRegular18)
                    .textInputAutocapitalization(.never)
                    .focused($focusedField, equals: focus)
            } else {
                TextField(string, text: text)
                    .font(.MainTextRegular18)
                    .textInputAutocapitalization(.never)
                    .focused($focusedField, equals: focus)
            }
            Divider()
                .background(focusedField == focus ? .green01 : .gray00)
        }
    }
    
    private var createButton: some View {
        Button(action: {
            if viewModel.user.nickname.count > 0 &&
               viewModel.user.email.count > 0 &&
               viewModel.user.password.count > 0 {
                viewModel.saveUserData()
                dismiss()
            }
        }, label: {
            ZStack {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 58)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .foregroundStyle(.green01)
                
                Text("생성하기")
                    .font(.MakeMedium18)
                    .foregroundStyle(.white)
            }
            .padding(.horizontal, 19)
        })
    }
}
