//
//  EnvironmentSettingsView.swift
//  week2practice
//
//  Created by 김미주 on 3/28/25.
//

import SwiftUI

struct EnvironmentSettingsView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        VStack {
            Text("설정 화면")
                .font(.largeTitle)
            
            TextField("사용자 이름 변경", text: $userViewModel.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

#Preview {
    EnvironmentSettingsView()
        .environmentObject(UserViewModel())
}
