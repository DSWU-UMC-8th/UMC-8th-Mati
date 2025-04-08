//
//  WhatsNewModel.swift
//  starbucks
//
//  Created by 김미주 on 4/8/25.
//

import Foundation
import SwiftUI

struct WhatsNewModel: Identifiable {
    let id = UUID()
    let bannerImage: Image
    let title: String
    let description: String
    
    init(bannerImage: Image, title: String, description: String) {
        self.bannerImage = bannerImage
        self.title = title
        self.description = description
    }
}
