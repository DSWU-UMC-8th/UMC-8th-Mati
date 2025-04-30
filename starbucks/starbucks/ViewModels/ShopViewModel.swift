//
//  ShopViewModel.swift
//  starbucks
//
//  Created by 김미주 on 4/13/25.
//

import Foundation

class ShopViewModel {
    let allProducts: [AllProductsModel] = [
        .init(image: .init(.imageProductTumbler), title: "텀블러"),
        .init(image: .init(.imageProductCoffee), title: "커피 용품"),
        .init(image: .init(.imageProductGift), title: "선물세트"),
        .init(image: .init(.imageProductBottle), title: "보온병"),
        .init(image: .init(.imageProductMug), title: "머그/컵"),
        .init(image: .init(.imageProductLife), title: "라이프스타일"),
    ]
    
    let bestItems: [BestItemsModel] = [
        .init(image: .init(.imageShopBest1), title: "그린 사이렌 슬리브 머그\n355ml"),
        .init(image: .init(.imageShopBest2), title: "그린 사이렌 클래식 머그\n355ml"),
        .init(image: .init(.imageShopBest3), title: "사이렌 머그 앤 우드 소서"),
        .init(image: .init(.imageShopBest4), title: "리저브 골드 테일 머그\n355ml"),
        .init(image: .init(.imageShopBest5), title: "블랙 앤 골드 머그\n473ml"),
        .init(image: .init(.imageShopBest6), title: "블랭 링 머그\n355ml"),
        .init(image: .init(.imageShopBest7), title: "북청사자놀음 데미머그\n89ml"),
        .init(image: .init(.imageShopBest8), title: "서울 제주 데미머그 세트"),
    ]
    
    let newProducts: [NewProductsModel] = [
        .init(image: .init(.imageShopNew1), title: "그린 사이렌 도트 머그\n237ml"),
        .init(image: .init(.imageShopNew2), title: "그린 사이렌 도트 머그\n355ml"),
        .init(image: .init(.imageShopNew3), title: "홈 카페 미니 머그 세트"),
        .init(image: .init(.imageShopNew3), title: "홈 카페 글라스 세트"),
    ]
}
