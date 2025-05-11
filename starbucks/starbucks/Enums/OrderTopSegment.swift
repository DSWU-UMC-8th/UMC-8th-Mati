//
//  OrderTopSegment.swift
//  starbucks
//
//  Created by 김미주 on 5/6/25.
//

import Foundation

enum OrderTopSegment: String, CaseIterable {
    case allMenu = "전체 메뉴"
    case myMenu = "나만의 메뉴"
    case cakeReservation = "홀케이크 예약"

    var fixedWidth: CGFloat? {
        switch self {
        case .allMenu, .myMenu:
            return 119
        case .cakeReservation:
            return nil
        }
    }
}

