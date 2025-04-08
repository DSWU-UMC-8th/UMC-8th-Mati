//
//  RecommendMenuModel.swift
//  starbucks
//
//  Created by 김미주 on 4/7/25.
//

import Foundation
import SwiftUI

struct RecommendMenuModel: Identifiable {
    let id = UUID()
    let menuImage: Image
    let menuName: String
    
    init(menuImage: Image, menuName: String) {
        self.menuImage = menuImage
        self.menuName = menuName
    }
}
