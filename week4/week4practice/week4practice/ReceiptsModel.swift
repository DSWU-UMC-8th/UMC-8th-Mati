//
//  ReceiptsModel.swift
//  week4practice
//
//  Created by 김미주 on 4/13/25.
//

import Foundation
import SwiftData

@Model
class ReceiptsModel {
    @Attribute(.unique) var id: UUID
    
    var orderer: String
    var store: String
    var menuItems: [String]
    var totalAmount: Int
    var orderNumber: String
    var createAt: Date
    
    init(
        orderer: String,
        store: String,
        menuItems: [String],
        totalAmount: Int,
        orderNumber: String,
        createAt: Date = Date()
    ) {
        self.id = UUID()
        self.orderer = orderer
        self.store = store
        self.menuItems = menuItems
        self.totalAmount = totalAmount
        self.orderNumber = orderNumber
        self.createAt = createAt
    }
}
