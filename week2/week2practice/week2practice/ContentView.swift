//
//  ContentView.swift
//  week2practice
//
//  Created by 김미주 on 3/26/25.
//

import SwiftUI

struct ContentView: View {
    @State private var count = 0 // 상태 프로퍼티 선언
    @State private var text: String = ""
    @State private var isClicked: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("카운트: \(count)") // 값이 변경되면 자동 업데이트
                    .font(.largeTitle)
                
                Button("증가") {
                    count += 1 // 상태 변경 시 UI 자동 업데이트
                }
                .padding()
            }

            VStack {
                Text("텍스트 내용: \(text)")
                    .font(.largeTitle)
                
                TextField("아무 값을 입력해보세요!", text: $text)
                    .frame(width: 350)
            }
            
            VStack {
                Text("현재 State 변수 값: \(isClicked)")
                
                CustomButton(isClicked: $isClicked)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
