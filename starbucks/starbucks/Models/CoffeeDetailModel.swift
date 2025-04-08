//
//  CoffeeDetailModel.swift
//  starbucks
//
//  Created by 김미주 on 4/8/25.
//

import Foundation
import SwiftUI

struct CoffeeDetailModel: Identifiable {
    let id = UUID()
    let image: Image
    let nameKor: String
    let nameEng: String
    let description: String
    let price: String
    let temp: String
    let only: Bool
    
    init(image: Image, nameKor: String, nameEng: String, description: String, price: String, temp: String, only: Bool) {
        self.image = image
        self.nameKor = nameKor
        self.nameEng = nameEng
        self.description = description
        self.price = price
        self.temp = temp
        self.only = only
    }
}
