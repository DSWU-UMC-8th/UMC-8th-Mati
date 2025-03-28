//
//  EnvironmentProfileView.swift
//  week2practice
//
//  Created by 김미주 on 3/28/25.
//

import SwiftUI

struct EnvironmentProfileView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        VStack {
            Text("프로필 화면")
                .font(.largeTitle)
            
            Text("사용자 이름: \(userViewModel.username)")
                .font(.title)
            
            Button("이름 변경") {
                userViewModel.username = "새로운 사용자"
            }
            .padding()
            .background(.blue)
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    EnvironmentProfileView()
        .environmentObject(UserViewModel())
}
