//
//  HotIcedButton.swift
//  starbucks
//
//  Created by 김미주 on 4/8/25.
//

import SwiftUI

struct HotIcedButton: View {
    @Binding var temp: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 18)
                .fill(.gray07)
                .frame(height: 36)
            
            HStack {
                makeButton(status: temp == "HOT", string: "HOT")
                makeButton(status: temp == "ICED", string: "ICED")
            }
        }
        .padding(.horizontal, 10)
    }
    
    private func makeButton(status: Bool, string: String) -> some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 0.3)) {
                temp = string
            }
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 18)
                    .fill(status ? .white : .clear)
                    .frame(height: 36)
                    .shadow(color: .black.opacity(0.25), radius: 5, x: 0, y: 1)
                
                Text(string)
                    .font(.MainTextSemiBold18)
                    .foregroundStyle(
                        status
                        ? (string == "ICED"
                           ? Color(red: 0, green: 0.13, blue: 0.98).opacity(0.63)
                           : Color(red: 1, green: 0, blue: 0).opacity(0.63))
                        : .gray02)
            }
        }
    }
}
