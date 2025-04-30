//
//  BestIemsModel.swift
//  starbucks
//
//  Created by 김미주 on 4/13/25.
//

import Foundation
import SwiftUI

struct BestItemsModel: Identifiable {
    let id = UUID()
    let image: Image
    let title: String
    
    init(image: Image, title: String) {
        self.image = image
        self.title = title
    }
}
