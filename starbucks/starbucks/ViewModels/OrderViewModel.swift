//
//  OrderViewModel.swift
//  starbucks
//
//  Created by 김미주 on 5/6/25.
//

import Foundation

class OrderViewModel {
    let orderDrinkMenu: [OrderDrinkModel] = [
        .init(image: .init(.imageOrderRecommend), titleKor: "추천", titleEng: "Recommend"),
        .init(image: .init(.imageOrderIcedAmericano), titleKor: "아이스 카페 아메리카노", titleEng: "Iced Americano"),
        .init(image: .init(.imageOrderAmericano), titleKor: "카페 아메리카노", titleEng: "Americano"),
        .init(image: .init(.imageOrderCappuccino), titleKor: "카푸치노", titleEng: "Cappuccino"),
        .init(image: .init(.imageOrderIcedCappuccino), titleKor: "아이스 카푸치노", titleEng: "Iced Cappuccino"),
        .init(image: .init(.imageOrderMacchiato), titleKor: "카라멜 마키아또", titleEng: "Caramel Macchiato"),
        .init(image: .init(.imageOrderIcedCappuccino), titleKor: "아이스 카라멜 마키아또", titleEng: "Iced Caramel Macchiato"),
        .init(image: .init(.imageOrderOthers), titleKor: "아포가토/기타", titleEng: "Others"),
        .init(image: .init(.imageOrderCortado), titleKor: "럼 샷 코르타도", titleEng: "Cortado"),
        .init(image: .init(.imageOrderBreve), titleKor: "라벤터 카페 브레베", titleEng: "Breve"),
        .init(image: .init(.imageOrderRTD), titleKor: "병음료", titleEng: "RTD")
    ]
}
