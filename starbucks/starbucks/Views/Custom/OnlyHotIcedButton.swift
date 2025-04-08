//
//  OnlyHotIcedButton.swift
//  starbucks
//
//  Created by 김미주 on 4/8/25.
//

import SwiftUI

struct OnlyHotIcedButton: View {
    let temp: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 18)
                .stroke(.gray)
                .fill(.white)
                .frame(height: 36)
            
            Text(temp + " ONLY")
                .font(.MainTextBold15)
                .foregroundStyle(temp == "ICED" ? Color(red: 0, green: 0.13, blue: 0.98).opacity(0.63)
                                 : Color(red: 1, green: 0, blue: 0).opacity(0.63))
        }
        .padding(.horizontal, 10)
    }
}

#Preview {
    OnlyHotIcedButton(temp: "HOT")
}
