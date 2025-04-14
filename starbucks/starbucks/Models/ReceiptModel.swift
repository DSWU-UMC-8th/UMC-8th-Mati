//
//  ReceiptModel.swift
//  starbucks
//
//  Created by 김미주 on 4/14/25.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class ReceiptModel {
    @Attribute(.unique) var id: UUID
    
    var store: String
    var date: String
    var total: Int
    var image: Data?
    var createAt: Date
    
    init(
        store: String,
        date: String,
        total: Int,
        image: UIImage,
        createAt: Date = Date()
    ) {
        self.id = UUID()
        self.store = store
        self.date = date
        self.total = total
        self.image = image.jpegData(compressionQuality: 0.8)
        self.createAt = createAt
    }
}
