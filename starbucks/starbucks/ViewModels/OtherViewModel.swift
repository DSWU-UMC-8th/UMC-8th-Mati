//
//  OtherViewModel.swift
//  starbucks
//
//  Created by 김미주 on 3/31/25.
//

import Foundation
import SwiftUI

@Observable
class OtherViewModel {
    let otherUserModel: [OtherModel] = [
        .init(icon: .init(.iconStarHistory), title: "별 히스토리"),
        .init(icon: .init(.iconReceipt), title: "전자영수증"),
        .init(icon: .init(.iconMy), title: "나만의 메뉴"),
    ]
    
    let otherPayModel: [OtherModel] = [
        .init(icon: .init(.iconCard), title: "스타벅스 카드 등록"),
        .init(icon: .init(.iconCardChange), title: "카드 교환권 등록"),
        .init(icon: .init(.iconCoupon), title: "쿠폰 등록"),
        .init(icon: .init(.iconConponHistory), title: "쿠폰 히스토리"),
    ]
    
    let otherCutomerModel: [OtherModel] = [
        .init(icon: .init(.iconStoreCare), title: "스토어 케어"),
        .init(icon: .init(.iconCustomer), title: "고객의 소리"),
        .init(icon: .init(.iconStoreInfo), title: "매장 정보"),
        .init(icon: .init(.iconReturnInfo), title: "반납기 정보"),
        .init(icon: .init(.iconMyReview), title: "마이 스타벅스 리뷰"),
    ]
}
