//
//  Font.swift
//  starbucks
//
//  Created by 김미주 on 3/22/25.
//

import Foundation
import SwiftUI

extension Font {
    enum Pretend {
        case extrabold
        case bold
        case semibold
        case medium
        case regular
        case light
        
        var value: String {
            switch self {
            case .extrabold:
                return "Pretendard-ExtraBold"
            case .bold:
                return "Pretendard-Bold"
            case .semibold:
                return "Pretendard-Semibold"
            case .medium:
                return "Pretendard-Medium"
            case .regular:
                return "Pretendard-Regular"
            case .light:
                return "Pretendard-Light"
            }
        }
    }
    
    static func pretend(type: Pretend, size: CGFloat) -> Font {
        return .custom(type.value, size: size)
    }
    
    // MARK: - mainText
    
    static var MainTextExtraBold24: Font {
        return .pretend(type: .extrabold, size: 24)
    }
    
    static var MainTextBold15: Font {
        return .pretend(type: .bold, size: 15)
    }
    
    static var MainTextBold20: Font {
        return .pretend(type: .bold, size: 20)
    }
    
    static var MainTextBold24: Font {
        return .pretend(type: .bold, size: 24)
    }
    
    static var MainTextSemiBold38: Font {
        return .pretend(type: .semibold, size: 38)
    }
    
    static var MainTextSemiBold24: Font {
        return .pretend(type: .semibold, size: 24)
    }
    
    static var MainTextSemiBold22: Font {
        return .pretend(type: .semibold, size: 22)
    }
    
    static var MainTextSemiBold18: Font {
        return .pretend(type: .semibold, size: 18)
    }
    
    static var MainTextSemiBold16: Font {
        return .pretend(type: .semibold, size: 16)
    }
    
    static var MainTextSemiBold14: Font {
        return .pretend(type: .semibold, size: 14)
    }
    
    static var MainTextSemiBold13: Font {
        return .pretend(type: .semibold, size: 13)
    }
    
    static var MainTextMedium16: Font {
        return .pretend(type: .medium, size: 16)
    }
    
    static var MainTextRegular18: Font {
        return .pretend(type: .regular, size: 18)
    }
    
    static var MainTextRegular16: Font {
        return .pretend(type: .regular, size: 16)
    }
    
    static var MainTextRegular13: Font {
        return .pretend(type: .regular, size: 13)
    }
    
    static var MainTextRegular12: Font {
        return .pretend(type: .regular, size: 12)
    }
    
    static var MainTextRegular09: Font {
        return .pretend(type: .regular, size: 9)
    }
    
    static var MainTextLight24: Font {
        return .pretend(type: .light, size: 24)
    }
    
    static var MainTextLight14: Font {
        return .pretend(type: .light, size: 14)
    }
    
    // MARK: - buttonText
    
    static var MakeMedium18: Font {
        return .pretend(type: .medium, size: 18)
    }

}
