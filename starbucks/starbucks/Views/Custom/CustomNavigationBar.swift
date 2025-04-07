//
//  CustomNavigationBar.swift
//  starbucks
//
//  Created by 김미주 on 4/7/25.
//

import SwiftUI

struct CustomNavigationBar<L, C, R>: ViewModifier where L: View, C: View, R: View {
    let leftView: (() -> L)?
    let centerView: (() -> C)?
    let rightView: (() -> R)?
    
    init(leftView: (() -> L)? = nil, centerView: (() -> C)? = nil, rightView: (() -> R)? = nil) {
        self.leftView = leftView
        self.centerView = centerView
        self.rightView = rightView
    }
    
    func body(content: Content) -> some View {
        VStack {
            ZStack {
                HStack {
                    self.leftView?()
                    
                    Spacer()
                    
                    self.rightView?()
                }
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 19)
                
                HStack {
                    Spacer()
                    
                    self.centerView?()
                    
                    Spacer()
                }
            }
            
            content
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
}
