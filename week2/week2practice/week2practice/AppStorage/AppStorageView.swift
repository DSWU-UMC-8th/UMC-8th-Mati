//
//  AppStorageView.swift
//  week2practice
//
//  Created by 김미주 on 3/28/25.
//

import SwiftUI

struct AppStorageView: View {
    @AppStorage("username") private var username: String = "Kim"
    @AppStorage("userAge") private var userAge: Int = 23
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    var body: some View {
        VStack {
            Text("Hello, \(username)!")
            Button("이름 변경") {
                username = "UMC"
            }
            
            Text("Age: \(userAge)")
            Button("나이 증가") {
                userAge += 1
            }
            
            Toggle("Dark Mode", isOn: $isDarkMode)
                .frame(width: 150)
        }
    }
}

#Preview {
    AppStorageView()
}
