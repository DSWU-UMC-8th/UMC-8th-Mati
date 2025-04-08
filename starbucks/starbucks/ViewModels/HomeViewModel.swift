//
//  HomeViewModel.swift
//  starbucks
//
//  Created by 김미주 on 4/7/25.
//

import Foundation

class HomeViewModel {
    let recommendMenu: [RecommendMenuModel] = [
        .init(menuImage: .init(.imageCoffee1), menuName: "에스프레소 콘 파나"),
        .init(menuImage: .init(.imageCoffee2), menuName: "에스프레소 마끼아또"),
        .init(menuImage: .init(.imageCoffee3), menuName: "아이스 카페 아메리카노"),
        .init(menuImage: .init(.imageCoffee4), menuName: "카페 아메리카노"),
        .init(menuImage: .init(.imageCoffee5), menuName: "아이스 카라멜 마끼아또"),
        .init(menuImage: .init(.imageCoffee6), menuName: "카라멜 마끼아또"),
    ]
    
    let whatsNew: [WhatsNewModel] = [
        .init(bannerImage: .init(.imageNew1), title: "25년 3월 일회용컵 없는 날 캠페..", description: "매월 10일은 일회용컵 없는 날! 스타벅스 에모매장에서 개인컵 및 다회용 컵을 이용하세요."),
        .init(bannerImage: .init(.imageNew2), title: "스타벅스 ooo점을 찾습니다", description: "스타벅스 커뮤니티 스토어 파트너를 운영할 기관을 공모합니다."),
        .init(bannerImage: .init(.imageNew3), title: "2월 8일, 리저브 스프링 신규 커...", description: "산뜻하고 달콤한 풍미가 가득한 리저브를 맛보세요."),
    ]
    
    let dessertMenu: [DessertModel] = [
        .init(menuImage: .init(.imageBread1), menuName: "너티 크루아상"),
        .init(menuImage: .init(.imageBread2), menuName: "매콤 소시지 불고기"),
        .init(menuImage: .init(.imageBread3), menuName: "미니 리프 파이"),
        .init(menuImage: .init(.imageBread4), menuName: "뺑 오 쇼콜라"),
        .init(menuImage: .init(.imageBread5), menuName: "소시지&올리브 파이"),
    ]
}
