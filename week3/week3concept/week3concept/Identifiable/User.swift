//
//  User.swift
//  week3concept
//
//  Created by 김미주 on 4/2/25.
//

import Foundation

struct User: Identifiable {
    let id = UUID()
    var name: String
    var age: Int
}
