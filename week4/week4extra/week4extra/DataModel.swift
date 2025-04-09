//
//  DataModel.swift
//  week4extra
//
//  Created by 김미주 on 4/9/25.
//

import Foundation
import SwiftData

@Model
class Task {
    @Attribute(.unique) var title: String // 할 일 제목
    var isDone: Bool // 완료 여부
    var createdAt: Date // 생성일
    
    @Transient var isBeingEdited: Bool = false
    
    init(title: String, isDone: Bool = false, createdAt: Date = .now) {
        self.title = title
        self.isDone = isDone
        self.createdAt = createdAt
    }
}
