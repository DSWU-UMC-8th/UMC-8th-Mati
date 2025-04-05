//
//  RainbowModel.swift
//  week3practice
//
//  Created by 김미주 on 4/6/25.
//

import Foundation
import SwiftUI

enum RainbowModel: CaseIterable {
    case red
    case orange
    case yellow
    case green
    case blue
    case indigo
    case purple
    
    func returnColor() -> Color {
        switch self {
        case .red:
            return .rainbowRed
        case .orange:
            return .rainbowOrange
        case .yellow:
            return .rainbowYellow
        case .green:
            return .rainbowGreen
        case .blue:
            return .rainbowBlue
        case .indigo:
            return .rainbowIndigo
        case .purple:
            return .rainbowPurple
        }
    }
    
    func returnColorName() -> String {
        switch self {
        case .red:
            return "빨강"
        case .orange:
            return "주황"
        case .yellow:
            return "노랑"
        case .green:
            return "초록"
        case .blue:
            return "파랑"
        case .indigo:
            return "남색"
        case .purple:
            return "보라"
        }
    }
}
