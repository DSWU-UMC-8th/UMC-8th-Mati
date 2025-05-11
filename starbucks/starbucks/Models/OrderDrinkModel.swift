//
//  OrderDrinkModel.swift
//  starbucks
//
//  Created by 김미주 on 5/6/25.
//

import Foundation
import SwiftUI

struct OrderDrinkModel: Identifiable {
    let id = UUID()
    let image: Image
    let titleKor: String
    let titleEng: String
    
    init(image: Image, titleKor: String, titleEng: String) {
        self.image = image
        self.titleKor = titleKor
        self.titleEng = titleEng
    }
}
