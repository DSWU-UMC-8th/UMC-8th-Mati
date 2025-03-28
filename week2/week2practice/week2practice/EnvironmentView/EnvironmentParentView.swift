//
//  EnvironmentParentView.swift
//  week2practice
//
//  Created by 김미주 on 3/28/25.
//

import SwiftUI

struct EnvironmentParentView: View {
    @StateObject var userViewModel: UserViewModel = .init()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("현재 사용자: \(userViewModel.username)")
                    .font(.title)
                
                NavigationLink(
                    "프로필 화면으로 이동",
                    destination: EnvironmentProfileView().environmentObject(userViewModel))
                NavigationLink(
                    "설정 화면으로 이동",
                    destination: EnvironmentSettingsView().environmentObject(userViewModel))
            }
        }
    }
}

#Preview {
    EnvironmentParentView()
}
